-- Toggle keymaps
-- Toggle Treesitter syntax highlighting
vim.keymap.set("n", "<leader>ts", function()
  local buf = vim.api.nvim_get_current_buf()
  
  -- Check if Treesitter is active for current buffer
  if vim.treesitter.highlighter.active[buf] then
    -- Treesitter is active, stop it
    vim.treesitter.stop(buf)
    vim.notify("Treesitter syntax highlighting disabled", vim.log.levels.INFO)
  else
    -- Treesitter is not active, start it
    vim.treesitter.start(buf)
    vim.notify("Treesitter syntax highlighting enabled", vim.log.levels.INFO)
  end
end, { desc = "Syntax highlighting" })
