return {
  "nvzone/showkeys",
  cmd = "ShowkeysToggle",
  keys = {
    { "<leader>tk", "<cmd>ShowkeysToggle<cr>", desc = "Showkeys" },
  },
  opts = {
    winopts = {
      border = vim.g.border,
      height = 1,
      row = 1,
      col = 0,
      zindex = 100,
    },
  },
}
