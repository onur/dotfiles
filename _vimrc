let mapleader = "\\"   " leader
syntax on
set et
set sw=2
set ts=4
set number
set numberwidth=4
set si " smart indent
set dir=~/.vim/swp/

" undo file
set undofile
set undodir=~/.vim/undo/

" esc: jk
inoremap jk <ESC>

autocmd BufNewFile *.html 0r ~/.vim/templates/skeleton.html
autocmd BufNewFile *.c 0r ~/.vim/templates/skeleton.c
autocmd BufNewFile *.pl 0r ~/.vim/templates/skeleton.pl
autocmd BufNewFile *.cc 0r ~/.vim/templates/skeleton.cc
autocmd BufNewFile *.cpp 0r ~/.vim/templates/skeleton.cc

map <F7> :!perl % <enter>
map <F8> :!gcc -g -Wall % <enter>
map <F9> :!gcc -g -Wall % <enter> :!$PWD/a.out <enter>

" Gcommit
map <F5> :Gcommit % <enter>


" netrw listing style
let g:netrw_liststyle=3
" netrw preview vertical split
let g:netrw_preview=1



set nocompatible
filetype off

" vundle
set rtp+=~/.vim/bundle/vundle
call vundle#begin()
Plugin 'gmarik/vundle'


"""""""""""
" BUNDLES "
"""""""""""

" vim-fugitive: Git extension
Plugin 'tpope/vim-fugitive'

" vim-airline: statusline
Plugin 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1

" GitGutter
Plugin 'airblade/vim-gitgutter'

" Nerdtree
Plugin 'scrooloose/nerdtree'

Plugin 'Valloric/MatchTagAlways'
Plugin 'mattn/emmet-vim'


Plugin 'othree/eregex.vim'

" syntastic syntax error checker
Plugin 'scrooloose/syntastic'
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler_options=' -std=c++11'


" terminal
Plugin 'conque_2.3'
let g:ConqueTerm_FastMode=0

" Markdown
Plugin 'tpope/vim-markdown'

" vimwiki
Plugin 'vimwiki'

" c & cpp syntax highlight
Plugin 'octol/vim-cpp-enhanced-highlight'

" Youcompleteme from debian package
Plugin 'vim-youcompleteme'



call vundle#end()
filetype plugin indent on

map <F2> :NERDTreeToggle <enter>

let g:ycm_server_log_level = 'debug'

" default vim background is dark
set background=dark


set colorcolumn=81
set completeopt="menu"

" mojolicious html
au BufRead,BufNewFile *.html.ep setfiletype html
