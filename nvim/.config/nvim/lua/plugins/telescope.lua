local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local builtin = require("telescope.builtin")

-- Custom function to handle opening multiple selections
-- If multiple files are selected with <Tab>, open all on <CR>
-- Otherwise, open the currently highlighted file
local function multi_open(prompt_bufnr)
  local picker = action_state.get_current_picker(prompt_bufnr)
  local selections = picker:get_multi_selection()

  if vim.tbl_isempty(selections) then
    -- No multi-selection: fallback to default behavior
    actions.select_default(prompt_bufnr)
  else
    -- Open each selected file
    actions.close(prompt_bufnr)
    for _, entry in ipairs(selections) do
      vim.cmd("edit " .. entry.path)
    end
  end
end

-- Telescope plugin setup with custom key mappings
require("telescope").setup({
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<CR>"]  = multi_open,
      },
      n = {
        ["<CR>"]  = multi_open,
      },
    },
  },
})

-- Caches git check results per working directory
local is_inside_work_tree = {}

-- Smart file picker using git if available in current directory
local function smart_find_files()
  local cwd = vim.fn.getcwd()

  -- Cache the git check result for efficiency
  if is_inside_work_tree[cwd] == nil then
    vim.fn.system("git rev-parse --is-inside-work-tree")
    is_inside_work_tree[cwd] = vim.v.shell_error == 0
  end

  -- Use git-aware file search if in a git repository
  if is_inside_work_tree[cwd] then
    builtin.git_files({ show_untracked = true })
  else
    builtin.find_files({})
  end
end

-- Key mappings
vim.keymap.set("n", "<leader>f", smart_find_files, {})
vim.keymap.set("n", "<leader>b", builtin.buffers, {})
vim.keymap.set("n", "<leader>d", builtin.diagnostics, { noremap = true })
vim.keymap.set("n", "<leader>h", builtin.help_tags, {})
vim.keymap.set("n", "gd", builtin.lsp_definitions, { noremap = true })
