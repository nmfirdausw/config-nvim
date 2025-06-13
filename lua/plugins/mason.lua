return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  dependencies = {
    {
      "williamboman/mason-lspconfig.nvim",
      cmd = { "LspInstall", "LspUninstall" },
    },
    {
      "williamboman/mason.nvim",
      cmd = "Mason",
      build = ":MasonUpdate",
      opts = {
        ui = {
          border = vim.g.border,
          height = 0.8,
        },
      },
    },
  },
  lazy = false,
  opts_extend = { "ensure_installed" },
  opts = {
    auto_update = true,
  },
}
