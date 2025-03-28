return {
  {
    "folke/trouble.nvim",
    { "folke/trouble.nvim", enabled = false },

    opts = {
      modes = {
        symbols = {
          mode = "lsp_document_symbols",
          win = {
            type = "split",
            relative = "editor",
            position = "bottom",
            size = 0.3,
          },
        },
      },
    },
  },
}
