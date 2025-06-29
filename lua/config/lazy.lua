-- Bootstrap lazy.nvim plugin manager
-- This sets up the path where lazy.nvim will be installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Check if lazy.nvim is already installed
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  -- If not installed, clone it from GitHub
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=main", lazyrepo, lazypath })
  
  -- Handle clone failures
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

-- Add lazy.nvim to the runtime path so we can require it
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim with configuration
require("lazy").setup("plugins", {
  defaults = {
    -- Make plugins lazy-loaded by default for faster startup
    lazy = true,
  },
  ui = {
    -- Use custom border style for lazy.nvim UI
    border = vim.g.border,
  },
  -- Set default colorscheme during plugin installation
  install = { colorscheme = { "default" } },
})
