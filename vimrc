""""""""""""""""""""""""""""""""""""""""""
" General Configurations
""""""""""""""""""""""""""""""""""""""""""
" Use Vim
set nocompatible
set encoding=utf8
" Line numbers
set number
set relativenumber
" Allow unsaved hidden buffers
set hidden
" Tab related
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
" Always display the status line on the bottom
set laststatus=2
" Syntax
" https://stackoverflow.com/questions/33380451/is-there-a-difference-between-syntax-on-and-syntax-enable-in-vimscript/33380495
syntax enable
set t_Co=256

set showmatch
set hlsearch
set wildmenu

" https://vi.stackexchange.com/questions/2162/why-doesnt-the-backspace-key-work-in-insert-mode
set backspace=indent,eol,start

set background=dark
let mapleader=","

""""""""""""""""""""""""""""""""""""""""""
" Vundle
""""""""""""""""""""""""""""""""""""""""""
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Utility
Plugin 'ctrlpvim/ctrlp.vim' " File finder for Vim

" Git Support
Plugin 'tpope/vim-fugitive'

" HTML
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" Theme
Plugin 'morhetz/gruvbox'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

""""""""""""""""""""""""""""""""""""""""""
" Mappings
""""""""""""""""""""""""""""""""""""""""""
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
nnoremap <leader><space> :nohlsearch<CR>

" Frequently used command
" Ctrl-W_z: Close any Preview window
" Ctrl-W [hjkl]: Move around windows
" Ctrl-W q: Close a window
" gt, gT: Move around tabs

""""""""""""""""""""""""""""""""""""""""""
" Gruvbox
""""""""""""""""""""""""""""""""""""""""""
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox
