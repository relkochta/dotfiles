" Neovim Configuration

" Vim-Plug
call plug#begin(stdpath('data') . '/plugged')

Plug 'sheerun/vim-polyglot'
Plug 'joshdick/onedark.vim'
Plug 'lervag/vimtex'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'akinsho/nvim-bufferline.lua'
Plug 'ryanoasis/vim-devicons'

" End Vim-Plug
call plug#end()

" Lightline Configuration
"let g:lightline = {
"      \ 'colorscheme': 'onedark',
"      \ }
let g:airline_theme='onedark'

" Install Coc Extensions
let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-clangd', 'coc-java',
            \ 'coc-tsserver', 'coc-pairs', 'coc-pyright', 'coc-vimtex',
            \ 'coc-sh', 'coc-css', 'coc-go', 'coc-html']

" Coc Configuration
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
				        \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Vimtex
let g:vimtex_view_method = 'zathura'

" Tab as 4 Spaces (by default)
" https://stackoverflow.com/a/234578
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

" Mouse Support
set mouse=a

" Highlight Current Line
set cursorline

" Line Numbers
set number

" Color Column (at 80 columns)
set colorcolumn=80

" Theme
syntax on
colorscheme onedark
set termguicolors

" Line Wrappiing
set wrap

" NERDTree Configuration
autocmd VimEnter * NERDTree | wincmd p
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

" Keyboard Shortcuts
nnoremap <C-PageUp> : tabp <CR>
nnoremap <C-PageDown> : tabn <CR>
nnoremap <C-n> : tabnew <CR>
nnoremap <C-b> : NERDTreeFocus <CR>

