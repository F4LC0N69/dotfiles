" Ensure vim-plug is installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs 
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" Set leader key to space (like Neovim)
let mapleader=" "
set rtp+=/opt/homebrew/opt/fzf
" Basic settings
set number            " Show line numbers
set relativenumber    " Relative line numbers
set tabstop=4         " Tab width
set shiftwidth=4      " Indentation width
set expandtab         " Use spaces instead of tabs
set smartindent       " Auto-indent new lines
set ignorecase        " Case-insensitive searching
set smartcase         " Case-sensitive if uppercase is used
set hlsearch          " Highlight search results
set incsearch         " Incremental search
set clipboard=unnamedplus " Use system clipboard
set termguicolors

" Load plugins using vim-plug
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'           " Sensible defaults
Plug 'tpope/vim-surround'           " Easy surrounding edits
Plug 'tpope/vim-commentary'         " Commenting shortcuts
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy finder
Plug 'junegunn/fzf.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Syntax highlighting
Plug 'catppuccin/vim', { 'as': 'catppuccin' } " Catppuccin Mocha theme

call plug#end()

" Set theme to Catppuccin Mocha
colorscheme catppuccin_mocha

" FZF Keybindings
nnoremap <C-p> :Files<CR>
nnoremap <C-b> :Buffers<CR>

" Save with Ctrl + S (like Neovim)
nnoremap <C-s> :w<CR>

" Remap Escape to jj (like in Neovim)
inoremap jj <Esc>
nnoremap ; :
