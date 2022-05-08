" Neovim Configuration

" ------ Vim-Plug ------
call plug#begin(stdpath('data') . '/plugged')

" Appearance
Plug 'arzg/vim-colors-xcode'
Plug 'ryanoasis/vim-devicons'
Plug 'arzg/vim-rust-syntax-ext'

" Language Plugins
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'lervag/vimtex'
Plug 'liuchengxu/vista.vim'

" Navigation/Info
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'akinsho/nvim-bufferline.lua'
Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }
Plug 'bagrat/vim-buffet'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'spolu/dwm.vim'

" Git
Plug 'tpope/vim-fugitive'

" Focus
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" ------ End Vim-Plug ------
call plug#end()

" Neovide Configuration
if exists('g:neovide')
    let g:neovide_cursor_animation_length = 0.13
    set guifont=Iosevka:h14
endif

" Theme
syntax on
colorscheme xcodedark
set termguicolors
set background=dark
let g:airline_theme='xcodedark'
let g:airline_powerline_fonts=1

" Activate Bufferline
lua << EOF
require('bufferline').setup {}
EOF

" Coc Language Servers
let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-clangd', 'coc-java',
            \ 'coc-tsserver', 'coc-pairs', 'coc-pyright', 'coc-vimtex',
            \ 'coc-sh', 'coc-css', 'coc-go', 'coc-html', 'coc-snippets',
            \ 'coc-rls', 'coc-solargraph']

" Coc Configuration
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
				        \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Code Snippets
" https://github.com/neoclide/coc-snippets
inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<TAB>"
let g:coc_snippet_next = '<TAB>'
let g:coc_snippet_prev = '<S-TAB>'

" Vista
let g:vista_default_executive = 'coc'
let g:vista_stay_on_open = 0

" VimTeX
let g:vimtex_view_method = 'zathura'
let g:vimtex_quickfix_mode = 0
let g:vimtex_view_forward_search_on_start = 0

" Disable VimTeX Conceal
" https://vi.stackexchange.com/a/17688
let g:tex_conceal = ''
set conceallevel=0

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

" Line Wrapping
set wrap

" NERDTree Configuration
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
autocmd BufWinEnter * NERDTreeMirror

" Keyboard Shortcuts
nnoremap <C-p> :Files<CR>
noremap <Tab> :bn<CR>
noremap <S-Tab> :bp<CR>
noremap <Leader><Tab> :Bw<CR>
noremap <Leader><S-Tab> :Bw!<CR>
noremap <C-t> :tabnew<CR>
noremap <C-w> :bdelete<CR>
nnoremap <F6> :Goyo <CR>
nnoremap <F5> :NERDTreeToggle() <CR>
nnoremap <C-b> :call NERDTreeFocusAndRefresh() <CR>

" https://stackoverflow.com/a/65743329
function NERDTreeFocusAndRefresh()
    :NERDTreeFocus
    :NERDTreeRefreshRoot
endfunction

" Toggle light/dark color scheme
" https://vi.stackexchange.com/a/6129
let s:mybg = "dark"
function! BackgroundToggle()
    if (s:mybg ==? "light")
        colorscheme xcodedark
        let g:airline_theme = "xcodedark"
        :AirlineRefresh
        let s:mybg = "dark"
    else
        colorscheme xcodelight
        let g:airline_theme = "xcodelight"
        :AirlineRefresh
        let s:mybg = "light"
    endif
endfunction
nnoremap <F7> :call BackgroundToggle() <CR>

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

" Adjust font size dynamically
" https://stackoverflow.com/a/51424640
let s:fontsize = 14
function! AdjustFontSize(amount)
    let s:fontsize = s:fontsize+a:amount
    :execute "GuiFont! Iosevka:h" . s:fontsize
endfunction
noremap <C-Up> :call AdjustFontSize(1)<CR>
noremap <C-Down> :call AdjustFontSize(-1)<CR>

" --- Per-Language Settings ---

" C
autocmd FileType c setlocal colorcolumn=80

" Documents/Text
autocmd FileType tex setlocal spell spelllang=en_us
autocmd FileType tex setlocal linebreak
autocmd FileType bib setlocal linebreak
autocmd FileType markdown setlocal linebreak
autocmd FileType markdown setlocal spell spelllang=en_us

