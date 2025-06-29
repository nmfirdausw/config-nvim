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
