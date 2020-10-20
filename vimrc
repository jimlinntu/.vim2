""""""""""""""""""""""""""""""""""""""""""
" General Configurations
""""""""""""""""""""""""""""""""""""""""""
" Use Vim
set nocompatible
set encoding=utf8
" Line numbers
set number
set relativenumber
" Show the cursorline
set cursorline
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
set foldmethod=syntax
set list
" https://vi.stackexchange.com/questions/422/displaying-tabs-as-characters
set listchars=tab:!\ ,trail:·

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
Plugin 'Yggdroot/indentLine'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-unimpaired'

" Code Completion
Plugin 'Valloric/YouCompleteMe'

" Git Support
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

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
nmap <F7> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
" https://stackoverflow.com/questions/23695727/vim-highlight-a-word-with-without-moving-cursor
nnoremap * *``
" See: https://learnvimscriptthehardway.stevelosh.com/chapters/32.html
" See: https://www.reddit.com/r/vim/comments/otbx2/help_how_to_not_jump_to_the_first_entry_of_the/
" Run :Ggrep on the current word and then open the quickfix list
nnoremap <leader>gg :Ggrep! <cword><cr>:copen<cr>
nnoremap <leader>jd :YcmCompleter GoTo<CR>
nnoremap <leader>jc :YcmCompleter GetDoc<CR>

""""""""""""""""""""""""""""""""""""""""""
" Commands
""""""""""""""""""""""""""""""""""""""""""
" Create a tags file over this folder
command! MakeTags !ctags -R .

""""""""""""""""""""""""""""""""""""""""""
" Frequently used command
""""""""""""""""""""""""""""""""""""""""""
" Ctrl-W_z: Close any Preview window
" Ctrl-W [hjkl]: Move around windows
" Ctrl-W q: Close a window
" gt, gT: Move around tabs
" za, zA, zR, zM: open and close folds
" Ctrl-], g]: jump to the tag under the cursor
" [b, ]b: :bprevious, :bnext (from vim-unimpaired)
" [q, ]q: :cprevious, :cnext (from vim-unimpaired)
" [<Space>, ]<Space>: add a new line before or after this cursor line
" Ctrl-P: open ctrlp prompt
" (inside the ctrlp prompt) <cr>, <c-cr>: open in this window, open in a horiz split window
" (inside the ctrlp prompt) <c-j>, <c-k>: move inside the prompt

""""""""""""""""""""""""""""""""""""""""""
" Gruvbox
""""""""""""""""""""""""""""""""""""""""""
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox

""""""""""""""""""""""""""""""""""""""""""
" indentLine
""""""""""""""""""""""""""""""""""""""""""
" https://vi.stackexchange.com/questions/7258/how-do-i-prevent-vim-from-hiding-symbols-in-markdown-and-json
let g:indentLine_fileTypeExclude = ['json', 'markdown']
let g:indentLine_color_term = 239
let g:indentLine_char = '|'

""""""""""""""""""""""""""""""""""""""""""
" GitGutter
""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_max_signs = 3000

""""""""""""""""""""""""""""""""""""""""""
" vim-airline
""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1

""""""""""""""""""""""""""""""""""""""""""
" YCM
""""""""""""""""""""""""""""""""""""""""""
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_max_diagnostics_to_display = 0

""""""""""""""""""""""""""""""""""""""""""
" A collection of my commands
""""""""""""""""""""""""""""""""""""""""""
augroup mycommands
    " https://vim.fandom.com/wiki/Folding
    " prevents having the autocommands defined twice
    " https://vi.stackexchange.com/questions/9455/why-should-i-use-augroup
    au!
    " set Python default foldmethod
    autocmd BufReadPre *.py set foldmethod=indent

    " Preserve the buffer position when switching them
    " https://stackoverflow.com/questions/4251533/vim-keep-window-position-when-switching-buffers
    if v:version >= 700
        au BufLeave * let b:winview = winsaveview()
        au BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
    endif

    " Unfold all after reading a buffer
    " https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
    au BufRead * normal zR
augroup END
