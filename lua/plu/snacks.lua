return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    animate = { enabled = false },
    bigfile = { enabled = true },
    explorer = { replace_netrw = true },
    indent = {
      enabled = true,
      indent = {
        only_scope = true,
      },
      scope = {
        enabled = true,
        underline = true,
      },
    },
    input = { enabled = true },
    lazygit = {
      win = {
        style = {
          width = 0,
          height = 0,
        },
      },
    },
    notifier = {
      enabled = true,
      icons = {
        error = "x",
        warn = "!",
        info = "i",
        debug = "$",
        trace = "&",
      },
    },
    picker = {
      actions = {
        flash = function(picker)
          require("flash").jump({
            pattern = "^",
            label = { after = { 0, 0 } },
            search = {
              mode = "search",
              exclude = {
                function(win)
                  return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= "snacks_picker_list"
                end,
              },
            },
            action = function(match)
              local idx = picker.list:row2idx(match.pos[1])
              picker.list:_move(idx, true, true)
            end,
          })
        end,
      },
      win = {
        input = {
          keys = {
            ["<M-s>"] = { "flash", mode = { "n", "i" } },
            ["s"] = { "flash" },
          },
        },
        list = {
          wo = {
            foldcolumn = "0",
          },
        },
        preview = {
          wo = {
            statuscolumn = "%!v:lua.Utils.picker.statuscolumn()",
            signcolumn = "no",
            foldcolumn = "0",
            foldenable = false,
          },
        },
      },
      sources = {
        autocmds = { layout = Utils.picker.layout },
        buffers = { layout = Utils.picker.layout },
        cliphist = { layout = Utils.picker.layout },
        colorschemes = { layout = Utils.picker.layout },
        command_history = {
          layout = {
            preview = false,
            layout = {
              box = "vertical",
              position = "bottom",
              border = "none",
              title = " {title} {live} {flags}",
              title_pos = "left",
              { win = "input", height = 1, border = "none" },
              { win = "list", border = "none" },
            },
          },
        },
        commands = { layout = Utils.picker.layout },
        diagnostics = { layout = Utils.picker.layout },
        diagnostics_buffer = { layout = Utils.picker.layout },
        explorer = {
          supports_live = true,
          tree = true,
          watch = true,
          diagnostics = true,
          diagnostics_open = true,
          git_status = true,
          git_status_open = true,
          git_untracked = true,
          auto_close = true,
          layout = Utils.picker.layout,
          formatters = {
            file = { filename_only = true },
            severity = { pos = "right" },
          },
          win = {
            list = {
              keys = {
                ["<leader>/"] = function()
                  Utils.picker.close()
                  Snacks.picker.grep()
                end,
              },
            },
          },
        },
        files = { layout = Utils.picker.layout },
        git_branches = { layout = Utils.picker.layout },
        git_diff = { layout = Utils.picker.layout },
        git_files = { layout = Utils.picker.layout },
        git_grep = { layout = Utils.picker.layout },
        git_log = { layout = Utils.picker.layout },
        git_log_file = { layout = Utils.picker.layout },
        git_log_line = { layout = Utils.picker.layout },
        git_stash = { layout = Utils.picker.layout },
        git_status = { layout = Utils.picker.layout },
        grep = { layout = Utils.picker.layout },
        grep_buffers = { layout = Utils.picker.layout },
        grep_word = { layout = Utils.picker.layout },
        help = { layout = Utils.picker.layout },
        highlights = { layout = Utils.picker.layout },
        icons = { layout = Utils.picker.layout },
        jumps = { layout = Utils.picker.layout },
        keymaps = { layout = Utils.picker.layout },
        lazy = { layout = Utils.picker.layout },
        lines = { layout = Utils.picker.layout },
        loclist = { layout = Utils.picker.layout },
        lsp_config = { layout = Utils.picker.layout },
        lsp_declarations = { layout = Utils.picker.layout },
        lsp_definitions = { layout = Utils.picker.layout },
        lsp_implementations = { layout = Utils.picker.layout },
        lsp_references = { layout = Utils.picker.layout },
        lsp_symbols = { layout = Utils.picker.layout },
        lsp_type_definitions = { layout = Utils.picker.layout },
        lsp_workspace_symbols = { layout = Utils.picker.layout },
        man = { layout = Utils.picker.layout },
        marks = { layout = Utils.picker.layout },
        notifications = { layout = Utils.picker.layout },
        picker_actions = { layout = Utils.picker.layout },
        picker_format = { layout = Utils.picker.layout },
        picker_layouts = { layout = Utils.picker.layout },
        picker_preview = { layout = Utils.picker.layout },
        pickers = { layout = Utils.picker.layout },
        projects = { layout = Utils.picker.layout },
        qflist = { layout = Utils.picker.layout },
        recent = { layout = Utils.picker.layout },
        registers = { layout = Utils.picker.layout },
        resume = { layout = Utils.picker.layout },
        seacrh_history = { layout = Utils.picker.layout },
        select = { layout = { preset = "select" } },
        smart = { layout = Utils.picker.layout },
        spelling = { layout = Utils.picker.layout },
        treesitter = { layout = Utils.picker.layout },
        undo = { layout = Utils.picker.layout },
        zoxide = { layout = Utils.picker.layout },
      },
      icons = {
        files = {
          enabled = true, -- show file icons
          dir = "󰉋 ",
          dir_open = "󰝰 ",
          file = "󰈔 ",
        },
        keymaps = {
          nowait = "󰓅 ",
        },
        tree = {
          vertical = "│ ",
          middle = "├╴",
          last = "└╴",
        },
        undo = {
          saved = " ",
        },
        ui = {
          live = "󰐰 ",
          hidden = "h",
          ignored = "i",
          follow = "f",
          selected = "● ",
          unselected = "○ ",
        },
        git = {
          enabled = true,
          commit = "󰜘 ",
          staged = "* ",
          added = "+ ",
          deleted = "- ",
          ignored = "_ ",
          modified = "~ ",
          renamed = "> ",
          unmerged = "# ",
          untracked = "? ",
        },
        diagnostics = {
          Error = "x ",
          Warn = "! ",
          Info = "i ",
          Hint = "? ",
        },
        lsp = {
          unavailable = "",
          enabled = " ",
          disabled = " ",
          attached = "󰖩 ",
        },
        kinds = {
          Array = " ",
          Boolean = "󰨙 ",
          Class = " ",
          Color = " ",
          Control = " ",
          Collapsed = " ",
          Constant = "󰏿 ",
          Constructor = " ",
          Copilot = " ",
          Enum = " ",
          EnumMember = " ",
          Event = " ",
          Field = " ",
          File = " ",
          Folder = " ",
          Function = "󰊕 ",
          Interface = " ",
          Key = " ",
          Keyword = " ",
          Method = "󰊕 ",
          Module = " ",
          Namespace = "󰦮 ",
          Null = " ",
          Number = "󰎠 ",
          Object = " ",
          Operator = " ",
          Package = " ",
          Property = " ",
          Reference = " ",
          Snippet = "󱄽 ",
          String = " ",
          Struct = "󰆼 ",
          Text = " ",
          TypeParameter = " ",
          Unit = " ",
          Unknown = " ",
          Value = " ",
          Variable = "󰀫 ",
        },
      },
    },
    scroll = { enabled = false },
  },
  keys = {
    {
      "<leader><space>",
      function()
        Utils.picker.close()
        Snacks.picker.smart()
      end,
      desc = "Files (Smart)",
    },
    {
      "<leader>,",
      function()
        Utils.picker.close()
        Snacks.picker.buffers()
      end,
      desc = "Buffers",
    },
    {
      "<leader>/",
      function()
        Utils.picker.close()
        Snacks.picker.grep()
      end,
      desc = "Grep",
    },
    {
      "<leader>:",
      function()
        Utils.picker.close()
        Snacks.picker.command_history()
      end,
      desc = "Command History",
    },
    {
      "<leader>n",
      function()
        Utils.picker.close()
        Snacks.picker.notifications()
      end,
      desc = "Notification History",
    },
    {
      "<leader>e",
      function()
        Utils.picker.close()
        Snacks.explorer()
      end,
      desc = "File Explorer",
    },
    {
      "<bs>",
      function()
        Utils.picker.close()
        Snacks.explorer()
      end,
      desc = "File Explorer",
    },
    -- find
    {
      "<leader>fb",
      function()
        Utils.picker.close()
        Snacks.picker.buffers()
      end,
      desc = "Buffers",
    },
    {
      "<leader>fc",
      function()
        Utils.picker.close()
        Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
      end,
      desc = "Config File",
    },
    {
      "<leader>ff",
      function()
        Utils.picker.close()
        Snacks.picker.files()
      end,
      desc = "Files",
    },
    {
      "<leader>fp",
      function()
        Utils.picker.close()
        Snacks.picker.projects()
      end,
      desc = "Projects",
    },
    {
      "<leader>fr",
      function()
        Utils.picker.close()
        Snacks.picker.recent()
      end,
      desc = "Recent",
    },
    -- Grep
    {
      "<leader>sb",
      function()
        Utils.picker.close()
        Snacks.picker.lines()
      end,
      desc = "Buffer Lines",
    },
    {
      "<leader>sB",
      function()
        Utils.picker.close()
        Snacks.picker.grep_buffers()
      end,
      desc = "Grep Open Buffers",
    },
    {
      "<leader>sg",
      function()
        Utils.picker.close()
        Snacks.picker.grep()
      end,
      desc = "Grep",
    },
    {
      "<leader>sw",
      function()
        Utils.picker.close()
        Snacks.picker.grep_word()
      end,
      desc = "Visual selection or word",
      mode = { "n", "x" },
    },
    -- search
    {
      "<leader>s\"",
      function()
        Utils.picker.close()
        Snacks.picker.registers()
      end,
      desc = "Registers",
    },
    {
      "<leader>s/",
      function()
        Utils.picker.close()
        Snacks.picker.search_history()
      end,
      desc = "Search History",
    },
    {
      "<leader>sa",
      function()
        Utils.picker.close()
        Snacks.picker.autocmds()
      end,
      desc = "Autocmds",
    },
    {
      "<leader>sb",
      function()
        Utils.picker.close()
        Snacks.picker.lines()
      end,
      desc = "Buffer Lines",
    },
    {
      "<leader>sc",
      function()
        Utils.picker.close()
        Snacks.picker.command_history()
      end,
      desc = "Command History",
    },
    {
      "<leader>sC",
      function()
        Utils.picker.close()
        Snacks.picker.commands()
      end,
      desc = "Commands",
    },
    {
      "<leader>sd",
      function()
        Utils.picker.close()
        Snacks.picker.diagnostics()
      end,
      desc = "Diagnostics",
    },
    {
      "<leader>sD",
      function()
        Utils.picker.close()
        Snacks.picker.diagnostics_buffer()
      end,
      desc = "Buffer Diagnostics",
    },
    {
      "<leader>sh",
      function()
        Utils.picker.close()
        Snacks.picker.help()
      end,
      desc = "Help Pages",
    },
    {
      "<leader>sH",
      function()
        Utils.picker.close()
        Snacks.picker.highlights()
      end,
      desc = "Highlights",
    },
    {
      "<leader>si",
      function()
        Utils.picker.close()
        Snacks.picker.icons()
      end,
      desc = "Icons",
    },
    {
      "<leader>sj",
      function()
        Utils.picker.close()
        Snacks.picker.jumps()
      end,
      desc = "Jumps",
    },
    {
      "<leader>sk",
      function()
        Utils.picker.close()
        Snacks.picker.keymaps()
      end,
      desc = "Keymaps",
    },
    {
      "<leader>sl",
      function()
        Utils.picker.close()
        Snacks.picker.loclist()
      end,
      desc = "Location List",
    },
    {
      "<leader>sm",
      function()
        Utils.picker.close()
        Snacks.picker.marks()
      end,
      desc = "Marks",
    },
    {
      "<leader>sM",
      function()
        Utils.picker.close()
        Snacks.picker.man()
      end,
      desc = "Man Pages",
    },
    {
      "<leader>sp",
      function()
        Utils.picker.close()
        Snacks.picker.lazy()
      end,
      desc = "Plugin Spec",
    },
    {
      "<leader>sq",
      function()
        Utils.picker.close()
        Snacks.picker.qflist()
      end,
      desc = "Quickfix List",
    },
    {
      "<leader>sR",
      function()
        Utils.picker.close()
        Snacks.picker.resume()
      end,
      desc = "Resume",
    },
    {
      "<leader>su",
      function()
        Utils.picker.close()
        Snacks.picker.undo()
      end,
      desc = "Undo History",
    },
    {
      "<leader>uC",
      function()
        Utils.picker.close()
        Snacks.picker.colorschemes()
      end,
      desc = "Colorschemes",
    },
    -- LSP
    {
      "gd",
      function()
        Utils.picker.close()
        Snacks.picker.lsp_definitions()
      end,
      desc = "Goto Definition",
    },
    {
      "gD",
      function()
        Utils.picker.close()
        Snacks.picker.lsp_declarations()
      end,
      desc = "Goto Declaration",
    },
    {
      "gr",
      function()
        Utils.picker.close()
        Snacks.picker.lsp_references()
      end,
      nowait = true,
      desc = "References",
    },
    {
      "gI",
      function()
        Utils.picker.close()
        Snacks.picker.lsp_implementations()
      end,
      desc = "Goto Implementation",
    },
    {
      "gy",
      function()
        Utils.picker.close()
        Snacks.picker.lsp_type_definitions()
      end,
      desc = "Goto Type Definition",
    },
    {
      "<leader>ss",
      function()
        Utils.picker.close()
        Snacks.picker.lsp_symbols()
      end,
      desc = "LSP Symbols",
    },
    {
      "<leader>sS",
      function()
        Utils.picker.close()
        Snacks.picker.lsp_workspace_symbols()
      end,
      desc = "LSP Workspace Symbols",
    },
    {
      "<leader>x",
      function()
        Snacks.bufdelete()
      end,
      desc = "Delete current buffer",
    },
    {
      "<leader>X",
      function()
        Snacks.bufdelete.other()
      end,
      desc = "Delete other buffer",
    },
    {
      "<leader>'",
      function()
        Snacks.scratch()
      end,
      desc = "Toggle Scratch Buffer",
    },
    {
      "<leader>\"",
      function()
        Snacks.scratch.select()
      end,
      desc = "Select Scratch Buffer",
    },
    {
      "<leader>tt",
      function()
        Snacks.terminal.toggle()
      end,
      desc = "Terminal",
    },
  },
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        -- Setup some globals for debugging (lazy-loaded)
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end
        vim.print = _G.dd -- Override print to use snacks for `:=` command

        -- Create some toggle mappings
        Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>ts")
        Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>tw")
        Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>tl")
        Snacks.toggle.diagnostics():map("<leader>td")
        Snacks.toggle.line_number():map("<leader>tn")
        Snacks.toggle
          .option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
          :map("<leader>tc")
        Snacks.toggle.treesitter():map("<leader>tT")
        Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>tb")
        Snacks.toggle.inlay_hints():map("<leader>th")
        Snacks.toggle.indent():map("<leader>ti")
        Snacks.toggle.dim():map("<leader>ts")
      end,
    })
  end,
}
