" Installs vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Install Vim Plugins
call plug#begin('~/.vim/plugged')

" Dark theme for vim
Plug 'dracula/vim',{'as':'dracula'}
" Language pack
Plug 'sheerun/vim-polyglot'
" Code completion
Plug 'Valloric/YouCompleteMe'
" Use snips in vim
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
call plug#end()

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Remove <tab> keybinding from YouCompleteMe so it doesn't interfere with snips
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Colour details
set t_Co=256
set background=dark

" 'matchit.vim' is built-in so let's enable it!
" Hit '%' on 'if' to jump to 'else'.
runtime macros/matchit.vim

" Install DoxygenToolkit from http://www.vim.org/scripts/script.php?script_id=987
let g:DoxygenToolkit_authorName="John Doe <john@doe.com>"

" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

" Various settings
set number                      " Turn line numbers on
set autoindent                  " Minimal automatic indenting for any filetype.
set backspace=indent,eol,start  " Proper backspace behavior.
set showmatch                   " Highlight matching braces
set hidden                      " Possibility to have more than one
                                " unsaved buffers.
set incsearch                   " Incremental search, hit '<CR>' to stop.
set ruler                       " Shows the current line number at the bottom.
                                " right of the screen.
set wildmenu                    " Great command-line completion, use '<Tab>' to
                                " move around and '<CR>' to validate.
set tabstop=4 shiftwidth=4 expandtab

" Function keys shortcuts
" in normal mode F2 will save the file
nmap <F2> :w<CR>
" in insert mode F2 will exit insert, save, enters insert again
imap <F2> <ESC>:w<CR>i
