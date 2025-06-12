return {
  cmd = { "intelephense", "--stdio" },
  filetypes = { "blade", "php" },
  root_markers = { "composer.json", ".git" },
  settings = {
    intelephense = {
      files = {
        maxSize = 1000000,
      },
    },
  },
}
