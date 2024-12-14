require('gitsigns').setup {
    signs = {
        add          = { text = '+' },
        change       = { text = '+' },
        delete       = { text = '-' },
        topdelete    = { text = '-' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
    },
    on_attach = function(bufnr)
        local gitsigns = require('gitsigns')
        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end

        map('n', ']h', function()
            if vim.wo.diff then
                vim.cmd.normal({']c', bang = true})
            else
                gitsigns.nav_hunk('next')
            end
        end)

        map('n', '[h', function()
            if vim.wo.diff then
                vim.cmd.normal({'[c', bang = true})
            else
                gitsigns.nav_hunk('prev')
            end
        end)

        map('n', '<leader>hh', gitsigns.preview_hunk)
        map('n', '<leader>hr', gitsigns.reset_hunk)
    end
}
