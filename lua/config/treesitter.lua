-- Parsers to install
local parsers = {
  "bash",
  "css",
  "dockerfile",
  "html",
  "javascript",
  "json",
  "lua",
  "markdown",
  "markdown_inline",
  "php",
  "python",
  "ruby",
  "sql",
  "terraform",
  "toml",
  "typescript",
  "yaml",
}

-- Automatically install the specified parsers
require("nvim-treesitter").install(parsers)

-- Automatically start Treesitter
vim.api.nvim_create_autocmd("FileType", {
  pattern = parsers,
  callback = function()
    vim.treesitter.start()
  end,
})
