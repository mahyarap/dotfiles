require("mason").setup()
local mason_registry = require("mason-registry")

local tools = {
  { name = "clangd" },
  { name = "pyright" },
  { name = "gopls" },
  { name = "shellcheck" },
  { name = "jdtls" },
  { name = "zls", version = "0.15.1" },
  { name = "ruff" },
  { name = "luacheck" },
  { name = "rust-analyzer" },
}

vim.api.nvim_create_user_command("MasonBootstrap", function()
  for _, tool in ipairs(tools) do
    local ok, pkg = pcall(mason_registry.get_package, tool.name)
    if not ok then
      vim.notify("Mason package not found: " .. tool.name, vim.log.levels.WARN)
    elseif not pkg:is_installed() then
      pkg:install({
        version = tool.version
      })
      vim.notify("Installing Mason package: " .. tool.name)
    end
  end
end, { desc = "Install configured Mason tools" })
