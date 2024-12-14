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
            height = 0.4,
        },
        border = true,
        sorting_strategy = 'ascending',
    },
}
