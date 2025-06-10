return {
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = { "BufReadPre", "BufWritePre", "InsertEnter" },
    opts = function()
      return {
        keywords = {
          -- FIX:
          FIX = {
            icon = "x",
            color = "error",
            alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
          },
          -- TODO:
          TODO = {
            icon = "?",
            color = "hint",
          },
          -- HACK:
          HACK = {
            icon = "!",
            color = "warning",
          },
          -- WARN:
          WARN = {
            icon = "!",
            color = "warning",
            alt = { "WARNING", "XXX" },
          },
          -- PERF:
          PERF = {
            icon = "i",
            alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" },
          },
          -- NOTE:
          NOTE = {
            icon = "i",
            color = "info",
            alt = { "INFO" },
          },
          -- TEST:
          TEST = {
            icon = "i",
            color = "test",
            alt = { "TESTING", "PASSED", "FAILED" },
          },
        },
      }
    end,
  },
}
