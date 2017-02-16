"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

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

  " COLORSCHEMES
  call dein#add('dracula/vim', { 'name': 'dracula' })
  call dein#add('tamelion/neovim-molokai')
  call dein#add('morhetz/gruvbox')
  call dein#add('frankier/neovim-colors-solarized-truecolor-only')

  " FILE SYSTEM
  call dein#add('scrooloose/nerdtree')

  " LINTING
  call dein#add('neomake/neomake')

  " SEARCHING
  call dein#add('mhinz/vim-grepper')

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


" PREFERENCES
set hlsearch
set number
set showcmd
set showmatch
set showmode
set ruler
set expandtab
set tabstop=2
set shiftwidth=2
set ignorecase
set smartcase
noremap ; :
"       ^^^aka win
set undodir=~/.local/share/nvim/undoes
set undolevels=10000 "defualt 1000
autocmd InsertChange,InsertLeave,TextCHanged * update | Neomake


" AWARENESS
" linting
let g:neomake_javascript_enabled_makers = ['eslint']
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
set wildignore+=*node_modules*

" COLOR SCHEMES
set termguicolors
" set background=light
" set background=dark
colorscheme dracula

" MANOEUVRES
" better window movement
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" NERDTree on right
let g:NERDTreeWinPos = 'right'
