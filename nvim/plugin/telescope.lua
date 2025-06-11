require('telescope').setup{
  defaults = {
    mappings = {
      n = {
        ["d"] = require("telescope.actions").delete_buffer,
        ["q"] = require("telescope.actions").close,
      }
    },
    layout_strategy = 'bottom_pane',
    layout_config = {
      height = 0.6,
    },
    border = true,
    sorting_strategy = 'ascending',
  },
  pickers = {
    buffers = {
      initial_mode = "normal",
      mappings = {
        n = {
          ["d"] = require("telescope.actions").delete_buffer,
          ["q"] = require("telescope.actions").close,
        },
      },
    },
  },
}

-- If no files open, automatically open file searcher
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argc() == 0 then
      require("telescope.builtin").find_files()
    end
  end
})
