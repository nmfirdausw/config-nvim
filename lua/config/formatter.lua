return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "biome",
        "black",
        "php-cs-fixer",
        "prettier",
        "shfmt",
        "sqruff",
        "stylua",
        "taplo",
        "terraform",
        "xmlformatter",
        "yamlfmt",
      },
    },
  },
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = {
      formatters_by_ft = {
        php = function()
          if vim.fn.executable("vendor/bin/duster") == 1 then
            return { "duster" }
          end

          if vim.fn.executable("vendor/bin/pint") == 1 then
            return { "pint" }
          end

          if vim.fn.executable("vendor/bin/php-cs-fixer") == 1 then
            return { "php_cs_fixer" }
          end

          return {}
        end,
        blade = function()
          local formatters = {}

          if vim.fn.executable("node_modules/.bin/blade-formatter") == 1 then
            table.insert(formatters, "blade_formatter")
          end

          if vim.fn.executable("vendor/bin/duster") == 1 then
            table.insert(formatters, "duster")
          elseif vim.fn.executable("vendor/bin/pint") == 1 then
            table.insert(formatters, "pint")
          end

          return formatters
        end,
        css = { "prettier" },
        fish = { "fish_indent" },
        html = { "prettier" },
        javascript = { "biome" },
        json = { "biome" },
        jsonc = { "biome" },
        lua = { "stylua" },
        markdown = { "prettier" },
        python = { "black" },
        rust = { "rustfmt" },
        sh = { "shfmt" },
        sql = { "sqruff" },
        terraform = { "terraform" },
        toml = { "taplo" },
        typescript = { "biome" },
        xml = { "xmlformatter" },
        yaml = { "yamlfmt" },
      },
      formatters = {
        duster = {
          command = "vendor/bin/duster",
          args = { "fix", "--quiet", "$FILENAME" },
          stdin = false,
        },
        pint = {
          command = "vendor/bin/pint",
          args = { "$FILENAME" },
          stdin = false,
        },
        php_cs_fixer = {
          command = "vendor/bin/php-cs-fixer",
          args = { "fix", "$FILENAME" },
          stdin = false,
        },
        blade_formatter = {
          command = "node_modules/.bin/blade-formatter",
          args = { "--write", "$FILENAME" },
          stdin = false,
        },
      },
      default_format_opts = {
        lsp_format = "fallback",
      },
      format_on_save = {
        lsp_format = "fallback",
        timeout_ms = 2000,
      },
    },
  },
}
