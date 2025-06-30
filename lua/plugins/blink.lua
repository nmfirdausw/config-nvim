return {
  "saghen/blink.cmp",
  event = { "InsertEnter", "CmdlineEnter" },
  dependencies = {
    "rafamadriz/friendly-snippets",
    {
      "onsails/lspkind.nvim",
      opts = {},
    },
  },
  build = "cargo build --release",
  opts = {
    keymap = {
      preset = "enter",
    },
    signature = {
      enabled = true,
      window = { border = vim.g.border },
    },
    completion = {
      documentation = {
        auto_show = true,
        window = { border = vim.g.border },
      },
      menu = {
        auto_show = true,
        border = "rounded",
        draw = {
          columns = { { "kind_icon", "label", "label_description", gap = 1 } },
          components = {
            kind_icon = {
              ellipsis = false,
              text = function(ctx)
                local lspkind = require("lspkind")
                local icon = ctx.kind_icon
                if vim.tbl_contains({ "Path" }, ctx.source_name) then
                  local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
                  if dev_icon then
                    icon = dev_icon
                  end
                  if string.sub(ctx.label, -1) == "/" then
                    icon = "󰝰 "
                  end
                else
                  icon = lspkind.symbolic(ctx.kind, {
                    mode = "symbol",
                  })
                end

                return icon .. ctx.icon_gap
              end,
              highlight = function(ctx)
                local hl = "BlinkCmpKind" .. ctx.kind
                if vim.tbl_contains({ "Path" }, ctx.source_name) then
                  local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
                  if dev_icon then
                    hl = dev_hl
                  end
                  if string.sub(ctx.label, -1) == "/" then
                    hl = "Directory"
                  end
                end
                return hl
              end,
            },
          },
        },
      },
      list = {
        selection = {
          preselect = false,
          auto_insert = false,
        },
      },
    },
    cmdline = {
      enabled = true,
      keymap = { preset = "inherit" },
      sources = function()
        local type = vim.fn.getcmdtype()
        if type == "/" or type == "?" then
          return { "buffer" }
        end
        if type == ":" or type == "@" then
          return { "cmdline", "path" }
        end
        return {}
      end,
      completion = {
        trigger = {
          show_on_blocked_trigger_characters = {},
          show_on_x_blocked_trigger_characters = {},
        },
        list = {
          selection = {
            preselect = false,
            auto_insert = true,
          },
        },
        menu = {
          auto_show = true,
        },
        ghost_text = { enabled = true },
      },
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
      providers = {
        lsp = {
          opts = { tailwind_color_icon = " " },
        },
      },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
  opts_extend = { "sources.default" },
}
