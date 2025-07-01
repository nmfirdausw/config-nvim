local parsers = {
  "bash",
  "blade",
  "c",
  "css",
  "diff",
  "dockerfile",
  "fish",
  "html",
  "javascript",
  "jsdoc",
  "json",
  "jsonc",
  "lua",
  "luadoc",
  "luap",
  "markdown",
  "markdown_inline",
  "php",
  "printf",
  "python",
  "query",
  "regex",
  "sql",
  "ssh_config",
  "terraform",
  "toml",
  "tsx",
  "typescript",
  "vim",
  "vimdoc",
  "xml",
  "yaml",
}

require("nvim-treesitter").install(parsers)

vim.api.nvim_create_autocmd("FileType", {
  pattern = parsers,
  callback = function()
    vim.treesitter.start()
    vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})

vim.keymap.set("n", "<leader>ts", function()
  local buf = vim.api.nvim_get_current_buf()

  if vim.treesitter.highlighter.active[buf] then
    vim.treesitter.stop(buf)
    vim.notify("Treesitter syntax highlighting disabled", vim.log.levels.INFO)
  else
    vim.treesitter.start(buf)
    vim.notify("Treesitter syntax highlighting enabled", vim.log.levels.INFO)
  end
end, { desc = "Syntax highlighting" })
