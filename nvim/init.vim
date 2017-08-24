"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Python Bullshit
" https://github.com/zchee/deoplete-jedi/wiki/Setting-up-Python-for-Neovim
" let g:python_host_prog = '/Users/watsonmarkson/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

" Required:
set runtimepath+=/Users/watsonmarkson/.local/share/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/watsonmarkson/.local/share/dein/')
  call dein#begin('/Users/watsonmarkson/.local/share/dein/')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/watsonmarkson/.local/share/dein//repos/github.com/Shougo/dein.vim')

  " AWARENESS
  " status line
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  " git status in NERDTree
  call dein#add('Xuyuanp/nerdtree-git-plugin')
  " git status in gutter
  call dein#add('airblade/vim-gitgutter')
  " colorschemes
  call dein#add('dracula/vim', { 'name': 'dracula' })
  call dein#add('tamelion/neovim-molokai')
  call dein#add('morhetz/gruvbox')
  call dein#add('frankier/neovim-colors-solarized-truecolor-only')
  " file system
  call dein#add('scrooloose/nerdtree')

  " EDITING
  " commenting
  call dein#add('scrooloose/nerdcommenter')
  " linting
  call dein#add('neomake/neomake')
  " autocomplete
  call dein#add('Shougo/deoplete.nvim')
  " searching
  call dein#add('mhinz/vim-grepper')
  " paired markers
  call dein#add('tpope/vim-surround')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------


" COLOR SCHEMES
set termguicolors
" set background=light
" set background=dark
colorscheme dracula

" PREFERENCES
set hlsearch
hi IncSearch ctermfg=17 ctermbg=228 cterm=NONE guifg=#282a36 guibg=#f1fa8c gui=NONE
hi Search ctermfg=NONE ctermbg=NONE cterm=NONE guifg=#282a36 guibg=#f38cbf gui=NONE
set number
set showcmd
set showmatch
set showmode
set ruler
set expandtab
set tabstop=2
set shiftwidth=2
set tabstop=2
set softtabstop=2
set textwidth=120
set fileformat=unix
set ignorecase
set smartcase
noremap ; :
"       ^^^aka win
set undodir=~/.local/share/nvim/undoes
set undolevels=10000 "defualt 1000
autocmd InsertChange,InsertLeave,TextCHanged * update | Neomake
" relative path for (v)split
if exists('+autochdir')
    set autochdir
else
    autocmd BufEnter * silent! lcd %:p:h:gs/ /\\ /
endif


" EDITING DETAILS
let mapleader = " "
" json
nnoremap gsjson :%!jq --sort-keys '.'<CR>

" AWARENESS
" linting
let g:neomake_javascript_enabled_makers = ['eslint']
" Use deoplete.
let g:deoplete#enable_at_startup = 1
" reasonable control interface for deoplete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" let g:neomake_verbose=3 " <<< for debugging <<<
" disaster zone (airline stuff)
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" git status
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" SEARCHING
" nnoremap <leader>a :Grepper
set wildignore+=node_modules/*
" auto-open quickfix
augroup quickfix
    autocmd!
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost l*    lwindow
augroup END
" the silver searcher
set grepprg=ag\ --nogroup\ --nocolor\ --ignore-case\ --column\ --vimgrep
set grepformat=%f:%l:%c:%m,%f:%l:%m

" MANOEUVRES
" better window movement
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
" super scrolling
nnoremap <a-j> 5j
nnoremap <a-k> 5k

" NERDTree on right
let g:NERDTreeWinPos = 'right'
