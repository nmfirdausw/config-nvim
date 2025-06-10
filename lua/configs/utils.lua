local M = {}

M.gitdir = function()
  local cwd = vim.fn.getcwd():gsub(" ", "\\ ")
  local gitdir = vim.fn.finddir(".git", cwd .. ";")
  return gitdir ~= ""
end

M.picker = {
  layout = function()
    local win_id = vim.api.nvim_get_current_win()
    local win_width = vim.fn.winwidth(0)
    local win_pos = vim.api.nvim_win_get_position(win_id)
    local term_width = vim.o.columns
    local height = vim.o.lines - vim.opt.cmdheight:get() - 1

    if win_pos[2] == 0 then
      local width = term_width - win_width
      if win_width >= term_width then
        local golden_width = math.floor(win_width / 1.618)
        width = win_width - golden_width
      end
      return {
        preview = "main",
        layout = {
          box = "horizontal",
          row = 0,
          col = term_width - width,
          width = width,
          height = height,
          {
            box = "vertical",
            border = "left",
            title = "{title} {live} {flags}",
            { win = "input", height = 1, border = { "", "", "", "", "", "", "", " " } },
            { win = "list", border = "none" },
          },
          { win = "preview", title = "{preview}", border = "none" },
        },
      }
    else
      local width = win_pos[2]
      print("width", width)
      return {
        preview = "main",
        layout = {
          box = "horizontal",
          row = 0,
          col = 0,
          width = width,
          height = height,
          {
            box = "vertical",
            border = "right",
            title = "{title} {live} {flags}",
            { win = "input", height = 1, border = "none" },
            { win = "list", border = "none" },
          },
          { win = "preview", title = "{preview}", border = "none" },
        },
      }
    end
  end,
  statuscolumn = function()
    return "%l%{&number?' │ ':''}"
  end,
  close = function()
    local buffers = vim.api.nvim_list_bufs()
    for _, buf in ipairs(buffers) do
      if vim.api.nvim_buf_is_valid(buf) then
        local ft = vim.api.nvim_buf_get_option(buf, "filetype")
        if ft:match("^snacks_picker_") then
          vim.api.nvim_buf_delete(buf, { force = true })
        end
      end
    end
  end,
}

return M
