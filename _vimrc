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
Bundle 'gmarik/vundle'


"""""""""""
" BUNDLES "
"""""""""""

" vim-fugitive: Git extension
Bundle 'tpope/vim-fugitive'

" vim-airline: statusline
Bundle 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1

" GitGutter
Bundle 'airblade/vim-gitgutter'

" Nerdtree
Bundle 'scrooloose/nerdtree'

" vim-orgmode
"Bundle 'jceb/vim-orgmode'
"Bundle 'tpope/vim-speeddating'

Bundle 'Valloric/MatchTagAlways'
Bundle 'mattn/emmet-vim'


Bundle 'othree/eregex.vim'

" Code completition
" Bundle 'Valloric/YouCompleteMe'
" YouCompleteMe options
"let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
"let g:ycm_global_ycm_extra_conf='/home/onur/code/debian/vim-youcompleteme/vim-youcompleteme-20130727+gitf347885/debian/ycm_extra_conf.py'


" syntastic syntax error checker
Bundle 'scrooloose/syntastic'
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler_options=' -std=c++11'


" terminal
Bundle 'conque_2.3'
let g:ConqueTerm_FastMode=0

" mediawiki
"Bundle 'mediawiki'

" Markdown
Bundle 'tpope/vim-markdown'

" vimwiki
Bundle 'vimwiki'

" c & cpp syntax highlight
Plugin 'octol/vim-cpp-enhanced-highlight'



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
