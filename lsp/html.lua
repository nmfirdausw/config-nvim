local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

return {
  cmd = { "vscode-html-language-server", "--stdio" },
  filetypes = { "blade", "html" },
  root_markers = {
    "package.json",
    ".git",
  },
  init_options = {
    configurationSection = { "html", "css", "javascript" },
    embeddedLanguages = {
      css = true,
      javascript = true,
    },
    provideFormatter = true,
  },
  capabilities = capabilities,
  settings = {},
}
