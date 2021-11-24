" Installs vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Vim Plugins
call plug#begin('~/.vim/plugged')
" Theme for vim
Plug 'dracula/vim', { 'as': 'dracula' }
" Language pack
Plug 'sheerun/vim-polyglot'
" Syntax colouring of hex codes and colour names
Plug 'chrisbra/Colorizer'
" Multiple selection feature
Plug 'terryma/vim-multiple-cursors'
" Improve netrw
Plug 'tpope/vim-vinegar'
call plug#end()

" Colour details
set t_Co=256
colorscheme dracula

" 'matchit.vim' is built-in so let's enable it!
" Hit '%' on 'if' to jump to 'else'.
runtime macros/matchit.vim

" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

" Various settings
set number                      " Turn line numbers on
set autoindent                  " Copy the indentation from the previous line 
set backspace=indent,eol,start  " Allows backspace to remove indents, EOL, etc.
set showmatch                   " Highlight matching braces
set showcmd                     " Notify command key being pressed
set clipboard=unnamed           " All yanks and deletes go to * (on-select) register
set hidden                      " Allows Vim to abandon a buffer even with unsaved changes 
set incsearch                   " Incremental search, hit CR to stop
set ruler                       " Shows the current line number at the bottom right.
set wildmenu                    " Great command-line completion, use '<Tab>' to
                                " move around and '<CR>' to validate.
set wildmode=longest:list,full  " First '<Tab>' will compleste to the longest common string first
set tabstop=4 shiftwidth=4 expandtab

" Syntax highlighting
syntax on 
filetype plugin on

" Insert newline without entering insert mode
nmap <CR> o<Esc>

" Required by vimwiki
set nocompatible

" Remap jj to Escape
inoremap jj <Esc>

" Function keys shortcuts
" in normal mode F2 will save the file
nmap <F2> :w<CR>
" in insert mode F2 will exit insert, save, enters insert again
imap <F2> <ESC>:w<CR>i
" Swap between headers and source files
nnoremap <F3> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
