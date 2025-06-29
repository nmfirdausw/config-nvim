require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    javascript = function()
      if vim.fn.executable("biome") == 1 or vim.fn.executable("node_modules/.bin/biome") == 1 then
        return { "biome" }
      end

      return {}
    end,
    typescript = function()
      if vim.fn.executable("node_modules/.bin/biome") == 1 then
        return { "biome" }
      end

      return {}
    end,
    json = function()
      if vim.fn.executable("node_modules/.bin/biome") == 1 then
        return { "biome" }
      end

      return {}
    end,
    jsonc = function()
      if vim.fn.executable("node_modules/.bin/biome") == 1 then
        return { "biome" }
      end

      return {}
    end,
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
    html = { "prettier" },
    markdown = { "prettier" },
    python = { "black" },
    sh = { "shfmt" },
    sql = { "sqruff" },
    terraform = { "terraform" },
    toml = { "taplo" },
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
    biome = {
      command = "node_modules/.bin/biome",
      args = { "format", "--write", "$FILENAME" },
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
})
