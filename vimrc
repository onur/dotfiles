"       ██▒   █▓ ██▓ ███▄ ▄███▓ ██▀███   ▄████▄
"      ▓██░   █▒▓██▒▓██▒▀█▀ ██▒▓██ ▒ ██▒▒██▀ ▀█
"       ▓██  █▒░▒██▒▓██    ▓██░▓██ ░▄█ ▒▒▓█    ▄
"        ▒██ █░░░██░▒██    ▒██ ▒██▀▀█▄  ▒▓▓▄ ▄██▒
"  ██▓    ▒▀█░  ░██░▒██▒   ░██▒░██▓ ▒██▒▒ ▓███▀ ░
"  ▒▓▒    ░ ▐░  ░▓  ░ ▒░   ░  ░░ ▒▓ ░▒▓░░ ░▒ ▒  ░
"  ░▒     ░ ░░   ▒ ░░  ░      ░  ░▒ ░ ▒░  ░  ▒
"  ░        ░░   ▒ ░░      ░     ░░   ░ ░
"   ░        ░   ░         ░      ░     ░ ░
"   ░       ░                           ░
"
"
" Copyright (c) 2015 Onur Aslan <onuraslan@gmail.com>
"
" This work is free. You can redistribute it and/or modify it under the
" terms of the Do What The Fuck You Want To Public License, Version 2,
" as published by Sam Hocevar. See http://www.wtfpl.net/ for more details.



set nocompatible              " a must for vim
let mapleader = ","           " leader key
syntax on                     " syntax highlighting always on
set et                        " expand tabs, use spaces instead of tabs
set sw=4                      " shiftwidth spaces to use for each indent
set ts=4                      " tabstop spaces <Tab> in the file counts for
set number                    " show line numbers
set numberwidth=4             " with of line numbers
set dir=$HOME/.vim/swp/       " swap directory
set laststatus=2              " always show status line
set undofile                  " enable undofile support
set undodir=$HOME/.vim/undo/  " directory for undo files
set background=dark           " default vim background is dark
set colorcolumn=81            " show a color in column 81
set clipboard=unnamed         " share clipboard between vim sessions


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom keybinds                                          "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" jk is ESC
inoremap jk <ESC>

" remove trailing whitespaces
nnoremap <Leader>rtw :%s/\s\+$//e<CR>

" new file templates
autocmd BufNewFile *.html 0r $HOME/.vim/templates/skeleton.html
autocmd BufNewFile *.c 0r $HOME/.vim/templates/skeleton.c
autocmd BufNewFile *.pl 0r $HOME/.vim/templates/skeleton.pl
autocmd BufNewFile *.cc 0r $HOME/.vim/templates/skeleton.cc
autocmd BufNewFile *.cpp 0r $HOME/.vim/templates/skeleton.cc


" shortcuts to run perl and c programs
map <F6> :!python3 % <enter>
map <F7> :!perl % <enter>
map <F8> :!gcc -g -Wall % <enter>
map <F9> :!gcc -g -Wall % <enter> :!$PWD/a.out <enter>


" mojolicious html files have .html.ep subfix
" treat them as html
au BufRead,BufNewFile *.html.ep setfiletype html




" required for vundle
filetype off


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS                                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=$HOME/.vim/bundle/vundle
call vundle#begin()
Plugin 'gmarik/vundle'



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-fugitive: Git extension, adds GCommit, Gstatus etc   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'tpope/vim-fugitive'
map <F5> :Gcommit % <enter>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-airline: statusline and tabbar                       "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'bling/vim-airline'
let g:airline_theme = 'hybrid'
let g:airline_powerline_fonts = 1

" tabbar
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_tab_type = 0


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GitGutter: See git diff in gutter                        "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'airblade/vim-gitgutter'

let g:gitgutter_sign_added = '★'
let g:gitgutter_sign_modified = '☉'
let g:gitgutter_sign_removed = '☆'
let g:gitgutter_sign_modified_removed = '☆'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree: Tree for nerds                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'scrooloose/nerdtree'
map <F2> :NERDTreeToggle <enter>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MatchTagAlways: Highlights starting and ending tag in    "
"                 HTML documents                           "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'Valloric/MatchTagAlways'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" emmet-vim: provides support for expanding abbreviations  "
"            similar to emmet.io                           "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'mattn/emmet-vim'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" eregex.vim: Perl regexes                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'othree/eregex.vim'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" syntastic: syntax error checker                          "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'scrooloose/syntastic'

let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler_options=' -std=c++11'

let g:syntastic_error_symbol = '⚡'
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_style_error_symbol = "♻"
let g:syntastic_style_warning_symbol = "♺"

" sign colors
highlight SyntasticErrorSign guifg=#cf6a4c guibg=#151515
highlight SyntasticWarningSign guifg=#ffb964 guibg=#151515
highlight SyntasticStyleErrorSign guifg=#8197bf guibg=#151515
highlight SyntasticStyleWarningSign guifg=#8197bf guibg=#151515


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" conque: terminal in vim                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'conque_2.3'
let g:ConqueTerm_FastMode=0


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-markdown: syntax highlighting for markdown files     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'tpope/vim-markdown'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vimwiki: local wiki inside vim                           "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'vimwiki'
let g:vimwiki_list = [{'path': '~/vimwiki/',
        \ 'template_path': '~/vimwiki/',
        \ 'template_default': 'template',
        \ 'template_ext': '.html',
        \ 'path_html': '/mnt/onur-home-server/public_html/vimwiki' }]


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-cpp-enhanced-highlight                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'octol/vim-cpp-enhanced-highlight'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-youcompleteme: code-completion                       "
" Requires vim-youcompleteme package in Debian             "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Plugin 'vim-youcompleteme'
let g:ycm_server_log_level = 'debug'
set completeopt="menu"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" rust                                                     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'rust-lang/rust.vim'

" racer is nice code completion for rust but unfortunately
" its running one instance per input and causing a undesirable
" performance
" I'll disable it until they implement a new library based engine
"
"Plugin 'phildawes/racer'
"let g:racer_cmd = "/home/onur/code/racer-master/target/release/racer"
"let $RUST_SRC_PATH="/home/onur/code/rust-master/src"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gpg                                                      "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'jamessanjj/vim-gnupg'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctlrp                                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'kien/ctrlp.vim'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-easymotion                                           "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'Lokaltog/vim-easymotion'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" supertab - required for UltiSnips conf                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'ervandew/supertab'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UltiSnips - ultimate solution for snippets               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine
Plugin 'honza/vim-snippets'

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LanguageTool                                             "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Plugin 'vim-scripts/LanguageTool'
"set spelllang=en_us
"let g:languagetool_jar = '$HOME/LanguageTool-3.0/languagetool-commandline.jar'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python syntax                                            "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'hdima/python-syntax'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" rustfmt vim-autoformat                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'Chiel92/vim-autoformat'
let g:formatdef_rustfmt = '"rustfmt"'
let g:formatters_rust = ['rustfmt']



call vundle#end()
filetype plugin indent on


autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2
autocmd FileType rust setlocal colorcolumn=100


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" color scheme                                             "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:hybrid_use_Xresources = 1
colorscheme hybrid

" git-gutter colors
highlight GitGutterAdd guifg=#8c9440
highlight GitGutterChange guifg=#de935f
highlight GitGutterDelete guifg=#cc6666


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GUI OPTIONS                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("gui_running")

  " guifont
  set guifont=Roboto\ Mono\ for\ Powerline\ 10
  " some other fonts:
  " * Terminus\ 8
  " * Ubuntu\ Mono\ 14
  " * Monospace\ 10
  " * Droid\ Sans\ Mono\ 11
  " * DejaVu\ Sans\ Mono\ for\ Powerline\ 10
  " * Source\ Code\ Pro
  " * Consolas\ 10
  " * Monaco\ 11
  " * Ubuntu\ Mono\ derivative\ Powerline\ 12

  " guioptions set lrbLR and -lrbLR to remove scrollbars
  " :help guioptions
  set go+=lrbLR
  set go-=lrbLR
  " remove menubar and toolbar as well
  set go-=m
  set go-=T

  " default size of gui window
  " not usable since i3
  "set lines=28 columns=88

  " titlestring is just file name
  set titlestring=%f

  " noequalalways
  " I don't want all windows to equal each other
  set noea

  " gitgutter
  " This is a bug in gitgutter
  " showing a background
  highlight clear SignColumn

endif
