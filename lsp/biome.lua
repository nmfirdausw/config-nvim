return {
  cmd = { "biome", "lsp-proxy" },
  filetypes = { "css", "javascript", "json", "jsonc", "typescript" },
  root_markers = {
    "biome.json",
    "biome.jsonc",
  },
  workspace_required = true,
}
