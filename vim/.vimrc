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
set cursorline                " highlight current line number


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
autocmd BufNewFile *.vue 0r $HOME/.vim/templates/skeleton.vue
autocmd BufNewFile docker-compose*.yml 0r $HOME/.vim/templates/docker-compose.yml

" PLUGINS
" https://github.com/tpope/vim-fugitive.git
map <F5> :Git<enter>
map <F6> :Git diff<enter>
map <F7> :Git commit<enter>

" https://github.com/itchyny/lightline.vim.git
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch' ],
      \             [ 'readonly', 'relativepath', 'modified' ] ],
      \   'right': [ [ 'syntastic', 'trailing', 'lineinfo' ], ['percent'],
      \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'component_expand': {
      \   'syntastic': 'SyntasticStatuslineFlag',
      \   'trailing': 'TrailingSpaceWarning',
      \   'indentation': 'MixedIndentSpaceWarning'
      \ },
      \ 'component_type': {
      \   'syntastic': 'error',
      \   'trailing': 'warning',
      \   'indentation': 'warning'
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

augroup AutoSyntastic
  autocmd!
  autocmd BufWritePost *.c,*.cpp call s:syntastic()
augroup END
function! s:syntastic()
  SyntasticCheck
  call lightline#update()
endfunction

function! TrailingSpaceWarning()
  if s:ftMatches('help') || winwidth(0) < 80 | return '' | endif
  let l:trailing = search('\s$', 'nw')
  return (l:trailing != 0) ? '… trailing[' . trailing . ']' : ''
endfunction

function! MixedIndentSpaceWarning()
  if s:ftMatches('help') || winwidth(0) < 80 | return '' | endif
  let l:tabs = search('^\t', 'nw')
  let l:spaces = search('^ ', 'nw')
  return (l:tabs != 0 && l:spaces != 0) ? '» mixed-indent[' . tabs . ']' : ''
endfunction

" https://github.com/airblade/vim-gitgutter.git
let g:gitgutter_sign_added = '★'
let g:gitgutter_sign_modified = '☉'
let g:gitgutter_sign_removed = '☆'
let g:gitgutter_sign_modified_removed = '☆'

" https://github.com/scrooloose/nerdtree.git
map <F2> :NERDTreeToggle <enter>

" https://github.com/othree/eregex.vim.git
" https://github.com/vimwiki/vimwiki.git
let g:vimwiki_list = [{'path': '~/.vimwiki/docs',
        \ 'syntax': 'markdown', 'ext': 'md', 'index': 'index' }]
let g:vimwiki_global_ext = 0

" https://github.com/preservim/nerdcommenter
" https://github.com/onur/vim-motivate
" https://github.com/nathanaelkane/vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent = 3


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" nord theme                                               "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/arcticicestudio/nord-vim.git


filetype plugin indent on

autocmd FileType html setlocal shiftwidth=2 tabstop=2 colorcolumn=100
autocmd FileType vue setlocal shiftwidth=2 tabstop=2 colorcolumn=100
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2
autocmd FileType rust setlocal colorcolumn=100
autocmd FileType vimwiki setlocal nowrap





""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" color scheme                                             "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:hybrid_use_Xresources = 1
"colorscheme jellybeans
"colorscheme nnkd
colorscheme nord

" git-gutter colors
highlight GitGutterAdd guifg=#8c9440
highlight GitGutterChange guifg=#de935f
highlight GitGutterDelete guifg=#cc6666


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GUI OPTIONS                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("gui_running")
  " guifont
  set guifont=Hack\ 10
  " some other fonts:
  " * Consolas\ 12
  " * Roboto\ Mono\ for\ Powerline\ 10
  " * Terminus\ 10
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

  " Make tabline looks like text
  set guioptions-=e

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
