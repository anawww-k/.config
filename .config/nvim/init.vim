

" better access to :commands
" normal, visual, select, operator-pending
noremap ; :
noremap : ;
noremap - _
noremap _ -
" insert, command-line, lang-arg
lnoremap ; :
lnoremap : ;
lnoremap - _
lnoremap _ -
" terminal
tnoremap ; :
tnoremap : ;
tnoremap - _
tnoremap _ -


" : is used way more than ;
inoremap ; :
inoremap : ;
inoremap - _
inoremap _ -


" y have a terrible split-pane-switching experience if u don't have to
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>


" need haz pkgz
" 'installation directory' ~/.local/nvim/dein

" make sure not to use the old ways
if &compatible
  set nocompatible
endif

" 'basic install' of dein (5/2023)
let $CACHE = expand('~/.cache')
if !isdirectory($CACHE)
  call mkdir($CACHE, 'p')
endif
if &runtimepath !~# '/dein.vim'
  let s:dein_dir = fnamemodify('dein.vim', ':p')
  if !isdirectory(s:dein_dir)
    let s:dein_dir = $CACHE .. '/dein/repos/github.com/Shougo/dein.vim'
    if !isdirectory(s:dein_dir)
      execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
    endif
  endif
  execute 'set runtimepath^=' .. substitue(
    \ fnamemodify(s:dein_dir, ':p') , '[/\\]$', '', '')
endif


" tell dein where to store things
let s:dein_base = '~/.cache/dein/' " (required)
let s:dein_src = '~/.cache/dein/repos/github.com/Shougo/dein.vim' " (required)
execute 'set runtimepath+=' .. s:dein_src
" (required) (for some reason i cant put this in / at the end of the line
" above w/o the " being treated like a string instead of a comment :/

"d	set runtimepath+=~/.local/nvim/dein/repos/github.com/Shougo/dein.vim

"d	if dein exist get dem fkn pkgz goinnnn
"d	if dein#load_state('~/.local/nvim/dein')

call dein#begin('~/.local/nvim/dein')


  " MANOEUVRES
  call dein#add('easymotion/vim-easymotion')
  call dein#add('tpope/vim-surround') "paired markers


  " AWARENESS
  "
  " status line
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')

  " git status in NERDTree
  call dein#add('Xuyuanp/nerdtree-git-plugin')

  " git status in gutter
  call dein#add('airblade/vim-gitgutter')

  " colorschemes
  call dein#add('dracula/vim', { 'name': 'dracula' })
  call dein#add('tamelion/neovim-molokai', { 'name': 'molokai' })
  call dein#add('morhetz/gruvbox', { 'name': 'gruvbox' })
  call dein#add('frankier/neovim-colors-solarized-truecolor-only', { 'name': 'solarized' })
  call dein#add('aereal/vim-colors-japanesque', { 'name': 'japanesque' })
  colorscheme dracula

  " file system
  call dein#add('scrooloose/nerdtree')


  " EDITING

  " commenting
  call dein#add('scrooloose/nerdcommenter')

  " linting
  call dein#add('neomake/neomake')
  call dein#add('functiform/neomake-local-flow.vim')

  " autocompleteeee
  call dein#add('Shougo/deoplete.nvim')
  let g:deoplete#enable_at_startup = 1
" reasonable control interface for deoplete
  inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

  " searching
  call dein#add('mhinz/vim-grepper')



call dein#end()
"d	call dein#save_state()
"d	endif



" allow smart indent and plugin access per filetype (ideally)
filetype indent plugin on

" turn on syntax highlighting ?  (not on default ?)
if has('syntax')
  syntax on
endif


" installs not-installed plugins on 'startup'
if dein#check_install()
  call dein#install()
endif
