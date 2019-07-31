" Installs vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Vim Plugins
call plug#begin('~/.vim/plugged')
" Dark theme for vim
Plug 'dracula/vim',{'as':'dracula'}
" Language pack
Plug 'sheerun/vim-polyglot'
" Syntax colouring of hex codes and colour names
Plug 'chrisbra/Colorizer'
" Auto code completion
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
" Full path fuzzy file finder
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
" Multiple selection feature
Plug 'terryma/vim-multiple-cursors'
" File directory viewer
Plug 'scrooloose/nerdtree'
" Async linting support
Plug 'dense-analysis/ale'
call plug#end()

" Colour details
set t_Co=256
set background=dark

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

" Required by vimwiki
set nocompatible

" Remap jj to Escape
inoremap jj <Esc>

" Function keys shortcuts
" in normal mode F2 will save the file
nmap <F2> :w<CR>
" in insert mode F2 will exit insert, save, enters insert again
imap <F2> <ESC>:w<CR>i
" Open NERDTree
map <F3> :NERDTreeToggle<CR>
" Swap between headers and source files
nnoremap <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

" FZF
nnoremap <leader>f :Files<cr>

" NERDTree
" Close Vim if only NERDTree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ALE
" Go to definition
noremap <leader>z :ALEGoToDefinition<CR>
" Find references
noremap <leader>x :ALEFindReferences<CR>
