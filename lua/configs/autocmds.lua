vim.api.nvim_create_autocmd("WinEnter", {
  callback = function()
    if vim.g.SessionLoad then
      return
    end

    if vim.bo.buftype == "" or vim.bo.buftype == "help" then
      -- Check if current tab has splits
      local normal_wins = {}
      for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
        local config = vim.api.nvim_win_get_config(win)
        if config.relative == "" then
          table.insert(normal_wins, win)
        end
      end

      -- Only resize if there are multiple windows (splits) in current tab
      if #normal_wins > 1 then
        local other_wins_count = #normal_wins - 1
        local min_width = 15 -- Minimum width for other windows

        -- Calculate max allowed width for current window
        local target_width = math.floor(vim.o.columns / 1.618)
        local max_allowed_width = vim.o.columns - (other_wins_count * min_width)
        local final_width = math.min(target_width, max_allowed_width)

        vim.cmd("vertical resize " .. final_width)

        -- Handle height resizing
        local current_height = vim.api.nvim_win_get_height(0)
        local terminal_height = vim.o.lines - 2
        if current_height < terminal_height then
          vim.api.nvim_win_set_height(0, math.floor(terminal_height / 1.618))
        end
      end
    end
  end,
})
