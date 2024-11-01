" Plugins "
call plug#begin()
    Plug 'vim-airline/vim-airline'           " Status bar
    Plug 'ap/vim-css-color'                   " CSS Color Preview
    Plug 'lervag/vimtex'                      " Vimtex
    Plug 'xuhdev/vim-latex-live-preview'     " Latex Live Preview
    Plug 'SirVer/ultisnips'                   " UltiSnips
    Plug 'rebelot/kanagawa.nvim'
    Plug 'jiangmiao/auto-pairs'              " Auto-pair brackets
    Plug 'preservim/nerdtree'                 " NERDTree (file manager)
    Plug 'nvim-tree/nvim-web-devicons'        " Nvim-web-devicons
    Plug 'ryanoasis/vim-devicons'
    Plug 'typicode/bg.nvim'                   " Background plugin
    Plug 'cohama/lexima.vim'                  " Lexima plugin
    Plug 'catppuccin/nvim', { 'as': 'catppuccin' }  " Catppuccin theme
    Plug 'sheerun/vim-polyglot'               " Syntax highlighting
    Plug 'neoclide/coc.nvim', {'branch': 'release'} " Code autocompletion
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' }
call plug#end()

" General Settings "
set number                    " Show line numbers
set relativenumber            " Show relative line numbers
set autoindent                " Enable auto-indentation
set smartindent
set tabstop=4                 " Set the number of spaces a tab counts for
set shiftwidth=4              " Set the number of spaces for auto-indentation
set smarttab                  " Use shiftwidth for tab behavior
set softtabstop=4             " Number of spaces to insert for a tab character
set mouse=a                   " Enable mouse support
set nocompatible              " For vim-polyglot

" Leader Key "
let mapleader = "\<Space>"

" Key Mappings "
nnoremap <leader><tab> :tabnext<CR>  " Cycle through tabs
nnoremap <leader>s :vsplit<CR>       " Vertical split
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" NERDTree Configuration "
nnoremap <C-e> :NERDTreeToggle<CR>
let g:NERDTreeWinSize = 22
let g:NERDTreeMinimalUI = 1
let g:NERDTreeShowHidden = 1

" Auto close brackets"
let g:lexima_no_default_rules = v:true

call lexima#add_rule({'char': '(', 'input': '()', 'leave': 1})
call lexima#add_rule({'char': '{', 'input': '{}', 'leave': 1})
call lexima#add_rule({'char': "'", 'input': "''", 'leave': 1})
call lexima#add_rule({'char': '"', 'input': '""', 'leave': 1})

" Auto Pairs Configuration "
" let g:AutoPairsMapBS = 1          " Enable auto-pairs for backspace
" let g:AutoPairs = {
"  \ '(' : ')',
"  \ '[' : ']',
"  \ '{' : '}',
"  \ "'" : "'"
"\ }

" LaTeX Configuration "
let g:vimtex_view_method = 'zathura'
let g:vimtex_syntax_enabled = 1
let g:livepreview_previewer = 'zathura'
let g:tex_conceal='abdmg'         " Code concealing for LaTeX
			
" UltiSnips Configuration "
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<C-tab>'

" Concealing Configuration "
set conceallevel=1              " Make code easier to read

" Vim-Airline Configuration "
let g:airline_theme = 'catppuccin'
let g:WebDevIconsUnicodeDecorateBuffer = 1

" Enable file type detection, plugins, and syntax highlighting "
filetype plugin on
syntax enable

" Use return key to confirm completion "
" noremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

nnoremap <F1> :vsplit<CR>:terminal<CR>
vnoremap <C-c> :w !wl-copy<CR><CR>

colorscheme catppuccin-mocha

