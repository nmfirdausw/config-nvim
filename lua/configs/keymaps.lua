-- Function to resize current window to specific width
local function resize_window_width(width)
  vim.cmd("vertical resize " .. width)
end

-- Set up the keymap (example: <leader>rw for "resize width")
vim.keymap.set("n", "<leader>rw", function()
  -- Prompt user for width
  local width = vim.fn.input("Enter width: ")
  if width ~= "" then
    resize_window_width(tonumber(width))
  end
end, { desc = "Resize window width" })

-- Or create specific shortcuts for common widths
vim.keymap.set("n", "<leader>r80", function()
  resize_window_width(80)
end, { desc = "Resize window to 80 columns" })

vim.keymap.set("n", "<leader>r120", function()
  resize_window_width(120)
end, { desc = "Resize window to 120 columns" })

-- You can also create a more flexible version that works with visual selection
vim.keymap.set("n", "<leader>rh", function()
  local width = vim.fn.input("Set width to: ", vim.api.nvim_win_get_width(0))
  if width ~= "" then
    resize_window_width(tonumber(width))
  end
end, { desc = "Resize window width (with current width as default)" })
