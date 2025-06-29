-- Global config
vim.g.border = "rounded"

-- System clipboard integration
vim.opt.clipboard = "unnamedplus"

-- Indentation and formatting
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.wrap = false

-- History and backup
vim.opt.backup = false
vim.opt.confirm = true
vim.opt.history = 1000
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undolevels = 1000
vim.opt.writebackup = false

-- Split behavior
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Number column
vim.opt.number = true
vim.opt.numberwidth = 1
vim.opt.relativenumber = true
