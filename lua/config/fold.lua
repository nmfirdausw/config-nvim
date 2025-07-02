local M = {
  -- Fold provider [ lsp, treesitter, indent ] per filetype
  ftprovider = {
    blade = "indent",
    css = "treesitter",
    fish = "indent",
    html = "indent",
    javascript = "treesitter",
    json = "indent",
    jsonc = "indent",
    lua = "indent",
    markdown = "treesitter",
    php = "treesitter",
    python = "lsp",
    rust = "lsp",
    sh = "treesitter",
    sql = "lsp",
    terraform = "treesitter",
    toml = "indent",
    typescript = "treesitter",
    xml = "indent",
    yaml = "indent",
  },
}

return M
