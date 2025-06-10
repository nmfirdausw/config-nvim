-- Set leader key to spacebar
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Global border configuration
vim.g.border = "rounded"

-- System clipboard integration
vim.opt.clipboard = "unnamedplus"

-- Indentation and formatting
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.wrap = false

-- History and backup settings
vim.opt.history = 1000
vim.opt.undolevels = 10000
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undofile = true
vim.opt.confirm = true

-- Search settings
vim.opt.incsearch = true
vim.opt.inccommand = "split"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true

-- Split behavior
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.splitkeep = "screen"

-- Folding
vim.opt.foldenable = true
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldmethod = "expr"

-- UI and appearance
vim.opt.list = true
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.fillchars = { eob = " " }
vim.opt.laststatus = 3

-- Columns and status
vim.opt.scrolloff = 8

-- Completion and editing
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.virtualedit = "block"
vim.opt.wildmode = "longest:full,full"
vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.isfname:append("@-@")

-- Timing and interaction
vim.opt.updatetime = 50
vim.opt.timeoutlen = 300
vim.opt.mouse = "a"
