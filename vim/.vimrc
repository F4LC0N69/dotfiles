" === 1. Auto-install vim-plug ===
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" === 2. Basic Settings ===
let mapleader = " "

set number                  " Show line numbers
set relativenumber          " Relative line numbers
set tabstop=4               " Tab width
set shiftwidth=4            " Indentation width
set expandtab               " Use spaces instead of tabs
set smartindent             " Auto-indent new lines
set ignorecase              " Case-insensitive searching
set smartcase               " Case-sensitive if uppercase is used
set hlsearch                " Highlight search results
set incsearch               " Incremental search
set clipboard=unnamedplus   " Use system clipboard
set termguicolors           " True color support
set mouse=a                 " Enable mouse support
set scrolloff=8             " Keep lines above/below cursor when scrolling
set updatetime=300          " Faster UI updates
set hidden                  " Allow background buffers without saving

" Persistent undo across sessions
if has('persistent_undo')
    set undodir=~/.vim/undodir
    set undofile
endif

" Enable Homebrew FZF dynamically (Mac Intel & Apple Silicon support)
if isdirectory('/opt/homebrew/opt/fzf')
    set rtp+=/opt/homebrew/opt/fzf
elseif isdirectory('/usr/local/opt/fzf')
    set rtp+=/usr/local/opt/fzf
endif

" === 3. Plugins ===
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'     " Sensible defaults
Plug 'tpope/vim-surround'     " Easy surrounding edits (cs"', ysiw", etc.)
Plug 'tpope/vim-commentary'   " Commenting shortcuts (gcc, gc)
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy finder binary
Plug 'junegunn/fzf.vim'       " FZF Vim integration
Plug 'catppuccin/vim', { 'as': 'catppuccin' } " Theme
Plug 'sheerun/vim-polyglot'   " Language syntax support for standard Vim

call plug#end()

" === 4. Theme & Appearance ===
" Safely load theme if installed
" Ensure Catppuccin uses a solid background
let g:catppuccin_flavour = "mocha"

" Force Vim to draw the theme background color
autocmd ColorScheme * highlight Normal guibg=#1e1e2e ctermbg=235

silent! colorscheme catppuccin_mocha

" === 5. Keybindings ===
" Clear search highlights with Leader + Space
nnoremap <leader><space> :noh<CR>

" FZF Keybindings
nnoremap <C-p> :Files<CR>
nnoremap <C-b> :Buffers<CR>
nnoremap <leader>fg :Rg<CR>

" Save with Ctrl + S (Normal & Insert mode)
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>a

" Navigation shortcuts between splits (Ctrl + hjkl)
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Remap Escape to jj
inoremap jj <Esc>

" Easy command mode
nnoremap ; :
