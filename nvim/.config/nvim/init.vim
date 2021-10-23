" Neovim Configuration

" ------ Vim-Plug ------
call plug#begin(stdpath('data') . '/plugged')

" Appearance
Plug 'arzg/vim-colors-xcode'
Plug 'chrisbra/Colorizer'
Plug 'ryanoasis/vim-devicons'

" Language Plugins
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'lervag/vimtex'
Plug 'liuchengxu/vista.vim'

" Navigation/Info
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'akinsho/nvim-bufferline.lua'

" Focus
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" ------ End Vim-Plug ------
call plug#end()
" Theme
syntax on
colorscheme xcodedark
set termguicolors

" Airline Configuration
let g:airline_theme='xcodedark'

" Install Coc Extensions
let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-clangd', 'coc-java',
            \ 'coc-tsserver', 'coc-pairs', 'coc-pyright', 'coc-vimtex',
            \ 'coc-sh', 'coc-css', 'coc-go', 'coc-html', 'coc-snippets']

" Coc Configuration
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
				        \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Vista
let g:vista_default_executive = 'coc'
let g:vista_stay_on_open = 0

" Vimtex
let g:vimtex_view_method = 'zathura'
let g:vimtex_quickfix_mode = 0

" Disable TeX Conceal
" https://vi.stackexchange.com/a/17688
let g:tex_conceal = ''
set conceallevel=0

" Code Snippets
" https://github.com/neoclide/coc-snippets
inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<TAB>"
let g:coc_snippet_next = '<TAB>'
let g:coc_snippet_prev = '<S-TAB>'

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

" Line Wrappiing
set wrap

" Highlight Colors
autocmd BufEnter * ColorHighlight

" NERDTree Configuration
autocmd VimEnter * NERDTree | wincmd p
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
autocmd BufWinEnter * NERDTreeMirror

" Keyboard Shortcuts
nnoremap <C-PageUp> : tabp <CR>
nnoremap <C-PageDown> : tabn <CR>
nnoremap <C-n> : tabnew <CR>
nnoremap <F6> : Goyo <CR>
nnoremap <C-b> : call NERDTreeFocusAndRefresh() <CR>

" https://stackoverflow.com/a/65743329
function NERDTreeFocusAndRefresh()
    :NERDTreeFocus
    :NERDTreeRefreshRoot
endfunction

" Toggle NERDTree & Limelight with Goyo
function! s:goyo_enter()
    Limelight
    NERDTreeClose
    
    set noshowmode
    set noshowcmd
    set scrolloff=999
endfunction
function! s:goyo_leave()
    Limelight!
    NERDTree

    set noshowmode
    set noshowcmd
    set scrolloff=0
endfunction
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

