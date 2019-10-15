

" better access to :commands
" normal, visual, select, operator-pending
noremap ; :
noremap : ;
" insert, command-line, lang-arg
lnoremap ; :
lnoremap : ;
" terminal
tnoremap ; :
tnoremap : ;


" : is used way more than ;
inoremap ; :
inoremap : ;


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

" tell dein where to store things
set runtimepath+=~/.local/nvim/dein/repos/github.com/Shougo/dein.vim

" if dein exist get dem fkn pkgz goinnnn
if dein#load_state('~/.local/nvim/dein')
  call dein#begin('~/.local/nvim/dein')



  " MANOEUVRES
  call dein#add('easymotion/vim-easymotion')
  call dein#add('tpope/vim-surround')


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

  " paired markers
  call dein#add('tpope/vim-surround')



  call dein#end()
  call dein#save_state()
endif

