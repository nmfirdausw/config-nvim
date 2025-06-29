return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    lazy = false,
    opts_extend = { "ensure_installed" },
    opts = {
      auto_update = true,
      run_on_start = true,
      ensure_installed = {},
    },
  },
  {
    "mason-org/mason-lspconfig.nvim",
    lazy = false,
    opts = {},
    dependencies = {
      {
        "mason-org/mason.nvim",
        opts = {
          ui = {
            border = vim.g.border,
          },
        },
      },
      { "neovim/nvim-lspconfig" },
    },
  },
}
