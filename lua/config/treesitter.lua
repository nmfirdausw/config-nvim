-- Parsers to install
local parsers = {
  "css",
  "html",
  "javascript",
  "php",
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
