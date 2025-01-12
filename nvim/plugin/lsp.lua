local on_attach = function(_, bufnr)

  local bufmap = function(keys, func)
    vim.keymap.set('n', keys, func, { buffer = bufnr })
  end

  bufmap('<leader>rn', vim.lsp.buf.rename)
  bufmap('<leader>ca', vim.lsp.buf.code_action)

  bufmap('gd', vim.lsp.buf.definition)
  bufmap('gD', vim.lsp.buf.declaration)
  bufmap('gI', vim.lsp.buf.implementation)
  bufmap('<leader>D', vim.lsp.buf.type_definition)

  bufmap('<leader>gr', require('telescope.builtin').lsp_references)
  bufmap('<leader>gs', require('telescope.builtin').lsp_document_symbols)
  bufmap('<leader>gS', require('telescope.builtin').lsp_dynamic_workspace_symbols)

  bufmap('<leader>ge', vim.diagnostic.open_float)
  bufmap('K', vim.lsp.buf.hover)

  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, {})
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
require('neodev').setup()

-- For keeping things concise
local function setup_basic(lang_server)
    lang_server.setup{
        capabilities = capabilities,
        on_attach = on_attach,
    }
end

require('lspconfig').lua_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
	root_dir = function()
        return vim.loop.cwd()
    end,
    settings = {
        Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
        },
    }
}

setup_basic(require'lspconfig'.nixd)
setup_basic(require'lspconfig'.texlab)
setup_basic(require'lspconfig'.bashls)
setup_basic(require'lspconfig'.rust_analyzer)
setup_basic(require'lspconfig'.clangd)
setup_basic(require'lspconfig'.pyright)
