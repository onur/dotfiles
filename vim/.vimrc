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
" Copyright (c) 2015-2024 Onur Aslan <onuraslan@gmail.com>
"
" This work is free. You can redistribute it and/or modify it under the
" terms of the Do What The Fuck You Want To Public License, Version 2,
" as published by Sam Hocevar. See http://www.wtfpl.net/ for more details.


colorscheme nord              " color scheme
let mapleader = ","           " leader key
syntax on                     " syntax highlighting always on
filetype plugin indent on     " allow plugins to indent
set nocompatible              " a must for vim
set expandtab                 " expand tabs, use spaces instead of tabs
set shiftwidth=4              " shiftwidth spaces to use for each indent
set tabstop=4                 " tabstop spaces <Tab> in the file counts for
set number                    " show line numbers
set numberwidth=4             " with of line numbers
set dir=$HOME/.vim/swp/       " swap directory
set laststatus=2              " always show status line
set undofile                  " enable undofile support
set undodir=$HOME/.vim/undo/  " directory for undo files
set background=dark           " default vim background is dark
set colorcolumn=81            " show a color in column 81
set clipboard=unnamed         " share clipboard between vim sessions
set cursorline                " highlight current line number

" key bindings
inoremap jk <ESC>             " jk is escape
nnoremap <Leader>rtw :%s/\s\+$//e<CR>  " remove trailing whitespaces

" filetype specific options
autocmd FileType html setlocal shiftwidth=2 tabstop=2 colorcolumn=100
autocmd FileType vue setlocal shiftwidth=2 tabstop=2 colorcolumn=100
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2
autocmd FileType vim setlocal shiftwidth=2 tabstop=2
autocmd FileType rust setlocal colorcolumn=100
autocmd FileType vimwiki setlocal nowrap

" new file templates
autocmd BufNewFile *.html 0r $HOME/.vim/templates/skeleton.html
autocmd BufNewFile *.c 0r $HOME/.vim/templates/skeleton.c
autocmd BufNewFile *.pl 0r $HOME/.vim/templates/skeleton.pl
autocmd BufNewFile *.cc 0r $HOME/.vim/templates/skeleton.cc
autocmd BufNewFile *.cpp 0r $HOME/.vim/templates/skeleton.cc
autocmd BufNewFile *.vue 0r $HOME/.vim/templates/skeleton.vue
autocmd BufNewFile docker-compose*.yml 0r $HOME/.vim/templates/docker-compose.yml

" gui options
if has("gui_running")
  set guifont=Hack\ 10

  " guioptions set lrbLR and -lrbLR to remove scrollbars
  " :help guioptions
  set go+=lrbLR
  set go-=lrbLR
  " remove menubar and toolbar as well
  set go-=m
  set go-=T

  " Make tabline looks like text
  set guioptions-=e

  " titlestring is just file name
  set titlestring=%f

  " noequalalways
  " I don't want all windows to equal each other
  set noequalalways

  " gitgutter
  " This is a bug in gitgutter
  " showing a background
  highlight clear SignColumn
endif


" plugins
" https://github.com/arcticicestudio/nord-vim
" https://github.com/ervandew/supertab
" https://github.com/preservim/nerdcommenter
" https://github.com/onur/vim-motivate
" https://github.com/othree/eregex.vim
" https://github.com/ctrlpvim/ctrlp.vim
" https://github.com/tpope/vim-fugitive
map <F5> :Git<enter>
map <F6> :Git diff<enter>
map <F7> :Git commit<enter>

" https://github.com/itchyny/lightline.vim
let g:lightline = {
  \ 'colorscheme': 'nord',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch' ],
  \             [ 'readonly', 'relativepath', 'modified' ] ],
  \   'right': [ [ 'trailing', 'lineinfo' ],
  \              ['percent'],
  \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
  \ },
  \ 'component': {
  \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
  \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}'
  \ },
  \ 'component_visible_condition': {
  \   'readonly': '(&filetype!="help"&& &readonly)',
  \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
  \   'fugitive': '(exists("*FugitiveHead") && ""!=FugitiveHead)'
  \ },
  \ 'component_expand': {
  \   'trailing': 'TrailingSpaceWarning'
  \ },
  \ 'component_type': {
  \   'trailing': 'warning'
  \ },
  \ 'component_function': {
  \   'gitbranch': 'FugitiveHead'
  \ },
  \ 'tabline': {
  \     'left': [ [ 'tabs' ] ],
  \     'right': [ [ 'close' ] ] }
  \ }

function! s:ftMatches(ft_name)
  return &ft =~ a:ft_name
endfunction

function! TrailingSpaceWarning()
  if s:ftMatches('help') || winwidth(0) < 80 | return '' | endif
  let l:trailing = search('\s$', 'nw')
  return (l:trailing != 0) ? '… trailing[' . trailing . ']' : ''
endfunction

" https://github.com/airblade/vim-gitgutter
let g:gitgutter_sign_added = '★'
let g:gitgutter_sign_modified = '☉'
let g:gitgutter_sign_removed = '☆'
let g:gitgutter_sign_modified_removed = '☆'
highlight GitGutterAdd guifg=#8c9440
highlight GitGutterChange guifg=#de935f
highlight GitGutterDelete guifg=#cc6666

" https://github.com/scrooloose/nerdtree
map <F2> :NERDTreeToggle <enter>

" https://github.com/vimwiki/vimwiki.git
let g:vimwiki_list = [{'path': '~/.vimwiki/docs',
  \ 'syntax': 'markdown', 'ext': 'md', 'index': 'index' }]
let g:vimwiki_global_ext = 0

" https://github.com/nathanaelkane/vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent = 3

" https://github.com/ntpeters/vim-better-whitespace
highlight ExtraWhitespace guibg=#cc6666
