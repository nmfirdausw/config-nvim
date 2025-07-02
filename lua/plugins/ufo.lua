return {
  "kevinhwang91/nvim-ufo",
  event = "BufReadPost",
  dependencies = {
    "kevinhwang91/promise-async",
  },
  keys = {
    {
      "<leader>zR",
      function()
        require("ufo").openAllFolds()
      end,
      desc = "Open All Folds",
    },
    {
      "<leader>zM",
      function()
        require("ufo").closeAllFolds()
      end,
      desc = "Close All Folds",
    },
    {
      "<leader>zr",
      function()
        require("ufo").openFoldsExceptKinds()
      end,
      desc = "Open Folds Except Kinds",
    },
    {
      "<leader>zm",
      function()
        require("ufo").closeFoldsWith(0)
      end,
      desc = "Close Folds With 0",
    },
    {
      "K",
      function()
        local winid = require("ufo").peekFoldedLinesUnderCursor()
        if not winid then
          vim.lsp.buf.hover()
        end
      end,
      desc = "Peek Folded Lines Under Cursor",
    },
  },
  opts = {
    ---@diagnostic disable-next-line: unused-local
    provider_selector = function(bufnr, filetype, buftype)
      local ftprovider = require("config.fold").ftprovider
      return ftprovider[filetype]
    end,
    fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
      local newVirtText = {}
      local suffix = (" 󰁂 %d "):format(endLnum - lnum)
      local sufWidth = vim.fn.strdisplaywidth(suffix)
      local targetWidth = width - sufWidth
      local curWidth = 0
      for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
          table.insert(newVirtText, chunk)
        else
          chunkText = truncate(chunkText, targetWidth - curWidth)
          local hlGroup = chunk[2]
          table.insert(newVirtText, { chunkText, hlGroup })
          chunkWidth = vim.fn.strdisplaywidth(chunkText)
          if curWidth + chunkWidth < targetWidth then
            suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
          end
          break
        end
        curWidth = curWidth + chunkWidth
      end
      table.insert(newVirtText, { suffix, "MoreMsg" })
      return newVirtText
    end,
    preview = {
      win_config = {
        border = vim.g.border,
        winblend = 0,
        winhighlight = "Normal:Normal",
        maxheight = 20,
      },
    },
  },
}
