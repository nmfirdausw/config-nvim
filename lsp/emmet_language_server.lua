return {
  cmd = { "emmet-language-server", "--stdio" },
  filetypes = { "blade", "css", "html" },
  init_options = {
    provideFormatter = true,
  },
  root_markers = {
    ".git",
  },
  settings = {
    css = {
      validate = true,
    },
  },
}
