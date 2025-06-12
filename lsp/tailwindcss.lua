return {
  cmd = { "tailwindcss-language-server", "--stdio" },
  filetypes = { "blade", "css", "html", "javascript" },
  root_markers = {
    "tailwind.config.js",
    "postcss.config.js",
    "vite.config.js",
  },
  settings = {
    tailwindCSS = {
      classAttributes = { "class", "className", "classList" },
      includeLanguages = {
        php = "html",
        blade = "html",
      },
      lint = {
        cssConflict = "warning",
        invalidApply = "error",
        invalidConfigPath = "error",
        invalidScreen = "error",
        invalidTailwindDirective = "error",
        invalidVariant = "error",
        recommendedVariantOrder = "warning",
      },
      validate = true,
    },
  },
  workspace_required = true,
}
