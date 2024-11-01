
vim.cmd([[
call plug#begin()
    Plug 'vim-airline/vim-airline'            " Status bar
    Plug 'ap/vim-css-color'                   " CSS Color Preview
    Plug 'lervag/vimtex'                      " Vimtex
    Plug 'SirVer/ultisnips'                   " UltiSnips
    Plug 'preservim/nerdtree'                 " NERDTree (file manager)
    Plug 'ryanoasis/vim-devicons'
    Plug 'typicode/bg.nvim'                   " Background plugin
    Plug 'cohama/lexima.vim'                  " bracket pairing
    Plug 'catppuccin/nvim', { 'as': 'catppuccin' }  " Catppuccin theme
    Plug 'https://github.com/nordtheme/vim'
    Plug 'sheerun/vim-polyglot'               " Syntax highlighting
    Plug 'nvim-telescope/telescope.nvim'	  " file finder
	Plug 'nvim-lua/plenary.nvim' 			  " dependency for telescope
	Plug 'williamboman/mason.nvim' 			  " all three for lsp
	Plug 'williamboman/mason-lspconfig.nvim'
	Plug 'neovim/nvim-lspconfig'
	Plug 'hrsh7th/nvim-cmp'" auto completion
	Plug 'hrsh7th/cmp-nvim-lsp'         	  " LSP source for nvim-cmp
	Plug 'hrsh7th/cmp-buffer'           	  " Buffer completions
call plug#end()
]])

-- standard configs
vim.g.mapleader = ' '

vim.cmd("set nocompatible")
vim.wo.number = true
vim.wo.relativenumber = true
vim.cmd('syntax on')
vim.cmd('filetype plugin on')
vim.o.smartindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.wo.cursorline = true
vim.o.encoding = 'utf-8'
vim.o.mouse = 'a'
vim.o.swapfile = false
vim.o.conceallevel = 1

-- keymaps
local set_keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

set_keymap('n', '<leader><tab>', ':tabnext<CR>', opts)
set_keymap('n', '<leader>s', ':vsplit<CR>', opts)
set_keymap('n', '<C-t>', ':tabnew<CR>', opts)
-- opens terminal in current directory
set_keymap('n', '<F1>', ':vsplit<CR>:cd %:p:h<CR>:terminal<CR>', opts)
set_keymap('v', '<C-c>', ':w !wl-copy<CR><CR>', opts)
-- move to visual mode and select all
set_keymap('n', '<C-a>', 'ggVG', opts)
-- regular bindings for undo redo
set_keymap('n', '<C-z>', 'u', opts)
set_keymap('n', '<C-y>', '<C-r>', opts)

-- file manager
vim.cmd([[
nnoremap <C-b> :NERDTreeToggle<CR>
let g:NERDTreeWinSize = 22
let g:NERDTreeMinimalUI = 1
let g:NERDTreeShowHidden = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
]])

-- theme related
vim.cmd([[
colorscheme nord
let g:nord_bold_vertical_split_line = 1

let g:airline_section_z = ""
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_line_number = 0
let g:airline#extensions#tabline#show_buffers = 0
]])
vim.g['airline#extensions#branch#enabled'] = 0
vim.g['airline#extensions#whitespace#enabled'] = 0
vim.g['airline#extensions#hunks#enabled'] = 0

-- lexima
vim.g.lexima_enable = 1

-- ultisnips

-- telescope
vim.cmd([[
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>)
]])

-- vimtex
vim.cmd([[
let g:vimtex_view_method = 'zathura'
let g:vimtex_syntax_enabled = 1
let g:tex_conceal='abdmg'
]])

-- ultisnips
vim.cmd([[ 
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<C-tab>'
]])

-- lsp configurations
-- note: you need to install the servers globally first
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",          -- Lua
        "pyright",         -- Python
        "clangd",          -- C++
        "gopls",           -- Go
        "html",            -- HTML
        "cssls",           -- CSS
        "ts_ls",           -- TypeScript/JavaScript
		"texlab"        -- LaTeX
    },
})
require("lspconfig").lua_ls.setup {}
require("lspconfig").pyright.setup {}
require("lspconfig").clangd.setup {}
require("lspconfig").gopls.setup {}
require("lspconfig").html.setup {
    cmd = { "vscode-html-languageserver-bin", "--stdio" },
}
require("lspconfig").cssls.setup {}
require("lspconfig").ts_ls.setup {}
require("lspconfig").texlab.setup {}

-- code autocompletion
local cmp = require("cmp")
cmp.setup({
    mapping = {
        ["<C-Space>"] = cmp.mapping.select_next_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "buffer" },
    },
})

require("mason-lspconfig").setup_handlers({
    function(server_name)
        require("lspconfig")[server_name].setup {
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
        }
    end,
})
