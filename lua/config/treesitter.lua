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
  "sql",
  "terraform",
  "toml",
  "typescript",
  "yaml",
}

require("nvim-treesitter").install(parsers)

vim.api.nvim_create_autocmd("FileType", {
  pattern = parsers,
  callback = function()
    vim.treesitter.start()
  end,
})
