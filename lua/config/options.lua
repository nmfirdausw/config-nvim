-- Global config
-- Remap leader key
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.border = "rounded"

-- UI and appearance
vim.opt.list = true
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.fillchars = { eob = " " }
vim.opt.laststatus = 3
vim.opt.listchars = { trail = "·" }
vim.api.nvim_set_hl(0, "Whitespace", { link = "DiagnosticInfo" })

-- Scrolling
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- Behavior
vim.opt.autochdir = false
vim.opt.encoding = "utf-8"
vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.clipboard:append("unnamedplus")
vim.opt.errorbells = false
vim.opt.hidden = true
vim.opt.iskeyword:append("-")
vim.opt.iskeyword:append("_")
vim.opt.modifiabre = true
vim.opt.mouse = "a"
vim.opt.path:append("**")
vim.opt.selection = "exclusive"

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
vim.opt.relativenumber = true

-- Folding
vim.opt.foldenable = true
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
