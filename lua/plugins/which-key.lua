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
      { "<leader>tg", desc = "Git", cond = Utils.gitdir() },
      { "<leader>g", desc = "Git", cond = Utils.gitdir() },
      { "<leader>gb", desc = "Blame", cond = Utils.gitdir() },
      { "<leader>gh", desc = "Hunk", cond = Utils.gitdir() },
      { "<leader>]", desc = "Next", cond = Utils.gitdir() },
      { "<leader>[", desc = "Previous", cond = Utils.gitdir() },
    },
  },
}
