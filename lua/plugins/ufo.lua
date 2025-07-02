return {
  "kevinhwang91/nvim-ufo",
  event = "BufReadPost",
  dependencies = {
    "kevinhwang91/promise-async",
  },
  opts = {
    provider_selector = function(bufnr, filetype, buftype)
      local ftprovider = require("config.fold").ftprovider
      return ftprovider[filetype]
    end,
  },
}
