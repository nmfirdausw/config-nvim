vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })

_G.Utils = require("configs.utils")

require("configs.options")
require("configs.diagnostic")
require("configs.lazy")
require("configs.lsp")
require("configs.statuscolumn")
require("configs.autocmds")
