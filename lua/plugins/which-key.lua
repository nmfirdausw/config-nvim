return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "helix",
    win = {
      no_overlap = true,
      col = 0,
      border = vim.g.border,
    },
    icons = {
      mappings = false,
    },
    spec = {
      { "<leader>t", desc = "Toggle" },
    },
  },
}
