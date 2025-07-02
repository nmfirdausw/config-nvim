local statuscolumn = function()
  local statuscolumn = "%=%4r%4l  "
  local lnum = vim.v.lnum
  local signs_hl = ""
  local bufnr = vim.api.nvim_get_current_buf()
  local signs = vim.fn.sign_getplaced(bufnr, { lnum = lnum, group = "*" })[1].signs
  local marks = vim.api.nvim_buf_get_extmarks(bufnr, -1, { lnum - 1, 0 }, { lnum - 1, -1 }, { details = true })

  for _, mark in ipairs(marks) do
    local _, _, _, details = unpack(mark)
    if details.sign_hl_group and details.sign_hl_group:match("^GitSigns") then
      signs_hl = details.sign_hl_group
      break
    end
  end

  if vim.fn.foldlevel(lnum) > 0 then
    if vim.fn.foldclosed(lnum) ~= -1 then
      return statuscolumn .. "%#" .. signs_hl .. "#+  "
    end
    if vim.fn.foldlevel(lnum) > vim.fn.foldlevel(lnum - 1) then
      if #signs > 0 and not signs[1].group:match("gitsigns_signs_") then
        return statuscolumn .. "%s "
      end
      return statuscolumn .. "%#" .. signs_hl .. "#-  "
    end
  end

  if #signs > 0 then
    return statuscolumn .. "%s "
  end
  return statuscolumn .. "%#" .. signs_hl .. "#│  "
end

vim.o.statuscolumn = "%{%v:lua._G.StatusColumn()%}"
vim.opt.number = true
vim.opt.relativenumber = true
_G.StatusColumn = statuscolumn

vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
  callback = function()
    if vim.bo.buftype == "help" then
      vim.opt_local.statuscolumn = ""
      vim.opt_local.number = false
      vim.opt_local.signcolumn = "no"
    end
  end,
})
