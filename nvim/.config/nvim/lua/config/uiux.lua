-- UI/UX Configuration

-- Color scheme
vim.opt.background = 'light'
vim.g.solarized_extra_hi_groups = 1
vim.cmd('colorscheme solarized8')

-- Minimal number of screen lines to keep above and below the cursor
vim.opt.scrolloff = 1

-- Set the command window height to 1 line to avoid needing to press <Enter> to continue
vim.opt.cmdheight = 1

-- Display line numbers on the left
vim.opt.number = true

-- Display fold indicator on the left
vim.opt.foldcolumn = 'auto:1'

-- When on, splitting a window will put the new window right of the current one
vim.opt.splitright = true

-- Status line
vim.opt.statusline = '%f%3(%m%)%r%h%w[%{&ff}]%{fugitive#statusline()}%=[%4lL,%2vC  %P]'

-- Cursor style
vim.opt.guicursor = 'n-v-c-sm:block,i-ci-ve:block,r-cr-o:block'

-- No mouse
vim.opt.mouse = ''

-- Raise a dialog asking if you wish to save unsaved changes instead of failing a command
vim.opt.confirm = true

-- Do not show extra information about the currently selected completion in the preview window
vim.opt.completeopt = { 'longest', 'menu', }

-- Enhanced command-line completion
vim.opt.wildmode = 'longest,list'

-- Disable modelines for security reasons
vim.opt.modeline = false

-- Specify how keyword completion works when using CTRL-P or CTRL-N
-- vim.opt.complete = { ".", "w", "b", "u", "t", "i", "d" }

-- Allow virtual editing in block mode
vim.opt.virtualedit:append({'block'})

-- Ignore certain file patterns when expanding wildcards or completing file/directory names
vim.opt.wildignore:append({'__pycache__', '*.pyc'})

-- Set the delay for the CursorHold event to fire
vim.opt.updatetime = 1000

-- Use case insensitive search, except when using capital letters
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- When on, the :substitute flag 'g' is default on.  This means that
-- all matches in a line are substituted instead of one.
vim.opt.gdefault = true

vim.opt.listchars = 'eol:$'
