return {
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    build = ":Copilot auth",
    opts = {
      suggestion = {
        auto_trigger = true,
        keymap = {
          accept = "<C-a>",
          next = "<C-n>",
          prev = "<C-e>",
        },
      },
    },
  },
}
