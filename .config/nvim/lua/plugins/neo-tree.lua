return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    --{ "nvim-neo-tree/neo-tree.nvim", enabled = false },
    opts = {
      event_handlers = {
        {
          event = "neo_tree_window_after_open",
          handler = function(args)
            local outliner = require("outline")
            outliner.open()
          end,
        },
        {
          event = "neo_tree_window_before_close",
          handler = function(args)
            local outliner = require("outline")
            outliner.close()
          end,
        },
      },
      sources = {
        "filesystem",
        "buffers",
        "git_status",
        -- "document_symbols",
      },
      source_selector = {
        winbar = true,
        sources = {
          { source = "filesystem" },
          { source = "buffers" },
          { source = "git_status" },
          -- { source = "document_symbols" },
        },
      },
      filesystem = {
        use_libuv_file_watcher = vim.loop.os_uname().sysname ~= "Windows_NT",
        filtered_items = {
          visible = true,
          show_hidden_count = true,
          hide_dotfiles = false,
          hide_gitignored = true,
          hide_by_name = {
            ".git",
            -- '.DS_Store',
            -- 'thumbs.db',
          },
          never_show = {},
        },
      },
    },
  },
}
