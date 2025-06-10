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
      { "<leader><leader>", desc = "Picker (search)" },
      { "<leader>s", desc = "Search" },
      { "<leader>f", desc = "Find" },
      { "<leader>g", desc = "Git", cond = Utils.gitdir() },
      { "<leader>gh", desc = "Hunk", cond = Utils.gitdir() },
      { "<leader>t", desc = "Toggle" },
      { "<leader>u", desc = "UI" },
    },
  },
}

