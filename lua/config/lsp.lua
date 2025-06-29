-- LSP to be installed with Mason
require("mason-lspconfig").setup {
  ensure_installed = {
    "bashls",
    "cssls",
    "dockerls",
    "emmet_ls",
    "html",
    "intelephense",
    "jsonls",
    "lua_ls",
    "ruff",
    "sqlls",
    "tailwindcss",
    "terraformls",
    "ts_ls",
    "yamlls",
  },
}
