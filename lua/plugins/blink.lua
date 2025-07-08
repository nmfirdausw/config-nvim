return {
  {
    "saghen/blink.cmp",
    version = "*",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    -- build = "cargo build --release",
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
            columns = {
              { "kind_icon" },
              { "label", "label_description", gap = 1 },
              { "kind" },
              { "source_name" },
            },
            components = {
              kind_icon = {
                ellipsis = false,
                text = function(ctx)
                  local icon = ctx.kind_icon
                  if vim.tbl_contains({ "Path" }, ctx.source_name) then
                    local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
                    if dev_icon then
                      icon = dev_icon
                    end
                    if string.sub(ctx.label, -1) == "/" then
                      icon = "󰝰 "
                    end
                  end

                  return icon .. ctx.icon_gap
                end,
                highlight = function(ctx)
                  local hl = ctx.kind_hl
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
        default = function()
          local Utils = require("config.utils")
          local sources = { "lsp", "path", "snippets", "buffer" }
          if Utils.is_laravel_project() then
            table.insert(sources, 1, "laravel")
          end
          return sources
        end,
        providers = {
          lsp = {
            opts = { tailwind_color_icon = " " },
          },
          laravel = {
            name = "Laravel",
            module = "laravel.blink_source",
            enabled = function()
              return vim.bo.filetype == "php" or vim.bo.filetype == "blade"
            end,
            -- kind = "Laravel",
            score_offset = 1000,
            min_keyword_length = 1,
          },
          cmdline = {
            min_keyword_length = 2,
          },
        },
      },
      fuzzy = { implementation = "prefer_rust_with_warning" },
    },
  },
  {
    "saghen/blink.pairs",
    version = "*",
    event = "InsertEnter",
    dependencies = "saghen/blink.download",
    -- build = "cargo build --release",
    opts = {
      mappings = {
        enabled = true,
        disabled_filetypes = {},
        pairs = {},
      },
      highlights = {
        enabled = false,
        matchparen = {
          enabled = true,
          group = "MatchParen",
        },
      },
      debug = false,
    },
  },
}
