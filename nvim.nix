{ pkgs, ... }:

{
  programs.neovim =
  let
    toLua = str: "lua << EOF\n${str}\nEOF\n";
    toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";

  in
  {
    enable = true;
    defaultEditor = true;
    viAlias = true;

    extraPackages = with pkgs; [
      lua-language-server
      clang-tools
      pyright
    ];

    plugins = [

      {
        plugin = pkgs.vimPlugins.telescope-nvim;
        config = toLuaFile ./nvim/plugin/telescope.lua;
      }

      {
        plugin = pkgs.vimPlugins.nvim-lspconfig;
        config = toLuaFile ./nvim/plugin/lsp.lua;
      }
      pkgs.vimPlugins.cmp-nvim-lsp

      {
        plugin = pkgs.vimPlugins.nvim-cmp;
        config = toLuaFile ./nvim/plugin/completion.lua;
      }

      {
        plugin = pkgs.vimPlugins.lsp_signature-nvim;
        config = toLua ''
        local signature_cfg = {
          bind = true,
          handler_opts = {
            border = "rounded"
          }
        }
        require("lsp_signature").setup(signature_cfg)
        '';
      }
      pkgs.vimPlugins.neodev-nvim

      {
        plugin = (pkgs.vimPlugins.nvim-treesitter.withPlugins (p: [
          p.tree-sitter-vim
          p.tree-sitter-bash
          p.tree-sitter-lua
          p.tree-sitter-python
          p.tree-sitter-cpp
          p.tree-sitter-c
          p.tree-sitter-json
        ]));
        config = toLuaFile ./nvim/plugin/treesitter.lua;
      }
      pkgs.vimPlugins.nvim-treesitter-context

      {
        plugin = pkgs.vimPlugins.catppuccin-nvim;
        config = "colorscheme catppuccin-mocha";
      }

      {
        plugin = pkgs.vimPlugins.lualine-nvim;
        config = toLuaFile ./nvim/plugin/lualine.lua;
      }

      {
        plugin = pkgs.vimPlugins.gitsigns-nvim;
        config = toLuaFile ./nvim/plugin/gitsigns.lua;
      }

      {
        plugin = pkgs.vimPlugins.nvim-autopairs;
        config = toLua ''
        require("nvim-autopairs").setup{}
        '';
      }

      pkgs.vimPlugins.lsp_signature-nvim
      pkgs.vimPlugins.comment-nvim
      pkgs.vimPlugins.nerdtree
    ];

    extraLuaConfig = ''

    vim.opt.guicursor = ""
    vim.opt.nu = true
    vim.opt.relativenumber = true
    vim.opt.tabstop = 4
    vim.opt.softtabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.expandtab = true
    vim.opt.smartindent = true
    vim.opt.wrap = false
    vim.opt.swapfile = false
    vim.opt.incsearch = true
    vim.opt.termguicolors = true
    vim.opt.scrolloff = 16
    vim.opt.mouse = ""

    vim.g.mapleader = ' '
    vim.keymap.set('n', '<leader>w'  , vim.cmd.w)
    vim.keymap.set('n', '<leader>x'  , vim.cmd.x)
    vim.keymap.set('n', '<leader>q'  , vim.cmd.q)
    vim.keymap.set('n', '<leader>bd' , vim.cmd.bd)
    vim.keymap.set('n', '<enter>'    , '<enter>z.')
    vim.keymap.set('n', '<C-u>'      , '<C-u>z.')
    vim.keymap.set('n', '<C-d>'      , '<C-d>z.')
    vim.keymap.set('n', '{'          , '}z.')
    vim.keymap.set('n', '}'          , '{z.')
    vim.keymap.set('n', '*'          , '*zz')
    vim.keymap.set('n', 'n'          , 'nzz')
    vim.keymap.set('n', 'N'          , 'Nzz')
    vim.keymap.set('v', 'J'          , ":m '>+1<CR>gv=gv")
    vim.keymap.set('v', 'K'          , ":m '<-2<CR>gv=gv")
    vim.keymap.set('x', '<leader>p'  , "\"_dP")
    vim.keymap.set('n', '<leader>d'  , "\"_d")
    vim.keymap.set('v', '<leader>d'  , "\"_d")
    vim.keymap.set('v', '<C-y>'      , "\"+y")
    vim.keymap.set('n', '<C-p>'      , "\"+p")
    vim.keymap.set('n', '<C-q>'      , ":set wrap!<CR>")
    vim.keymap.set('n', 'H', ":bprevious<CR>")
    vim.keymap.set('n', 'L', ":bnext<CR>")
    vim.keymap.set('n', '<leader>t'  , ":NERDTreeToggle<CR>")

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>sf'  , builtin.find_files, {})
    vim.keymap.set('n', '<leader>sg'  , builtin.live_grep, {})
    vim.keymap.set('n', '<leader>sd'  , builtin.diagnostics , {})

    -- This is a super nice for large paragraph yanks
    local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
    vim.api.nvim_create_autocmd('TextYankPost', {
      callback = function()
        vim.highlight.on_yank()
      end,
      group = highlight_group,
      pattern = '*',
    })
    '';
  };
}
