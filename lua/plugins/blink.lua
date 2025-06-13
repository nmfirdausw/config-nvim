return {
  "saghen/blink.cmp",
  event = { "InsertEnter", "CmdlineEnter" },
  dependencies = { "rafamadriz/friendly-snippets" },
  build = "cargo build --release",
  opts = {
    keymap = {
      preset = "enter",
    },
    signature = {
      enabled = true,
    },
    completion = {
      documentation = { auto_show = true },
      menu = {
        auto_show = true,
        border = "rounded",
      },
      list = {
        selection = {
          preselect = false,
          auto_insert = false,
        },
      },
    },
    cmdline = {
      keymap = { preset = "inherit" },
      completion = {
        menu = {
          auto_show = true,
        },
        list = {
          selection = {
            preselect = false,
            auto_insert = false,
          },
        },
      },
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
  opts_extend = { "sources.default" },
}
