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


" shortcuts to run perl and c programs
map <F3> @:
map <F6> :!python3 % <enter>
map <F7> :!perl % <enter>
map <F8> :!gcc -g -Wall % <enter>
map <F9> :!gcc -g -Wall % <enter> :!$PWD/a.out <enter>


" mojolicious html files have .html.ep subfix
" treat them as html
au BufRead,BufNewFile *.html.ep setfiletype html
" au BufRead,BufNewFile *.vue setfiletype html

" handlebar templates
au BufRead,BufNewFile *.hbs setfiletype htmldjango




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
map <F5> :Gstatus<enter>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-airline: statusline and tabbar                       "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Plugin 'bling/vim-airline'
"let g:airline_theme = 'hybrid'
"let g:airline_powerline_fonts = 1
"
"" tabbar
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#show_buffers = 0
"let g:airline#extensions#tabline#show_close_button = 0
"let g:airline#extensions#tabline#show_tab_type = 0


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-vue                                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'posva/vim-vue'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lightbar: light statusline and tabbar                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'itchyny/lightline.vim'
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'relativepath', 'modified' ] ],
      \   'right': [ [ 'syntastic', 'trailing', 'lineinfo' ], ['percent'],
      \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
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

let g:syntastic_mode_map = {'mode':'passive'}

let g:syntastic_check_on_open = 0
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
"Plugin 'tpope/vim-markdown'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vimwiki: local wiki inside vim                           "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'vimwiki'
let g:vimwiki_list = [{'path': '~/.vimwiki/docs',
        \ 'syntax': 'markdown', 'ext': '.md' }]


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-cpp-enhanced-highlight                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'octol/vim-cpp-enhanced-highlight'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-youcompleteme: code-completion                       "
" Requires vim-youcompleteme package in Debian             "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Plugin 'vim-youcompleteme'
"let g:ycm_server_log_level = 'debug'
""let g:ycm_global_ycm_extra_conf = ''
"set completeopt="menu"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" coc.nvim: code-completion                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Decided to try LanguageClient
"Plugin 'neoclide/coc.nvim'
"" if hidden is not set, TextEdit might fail.
"set hidden
"
"" Some servers have issues with backup files, see #649
"set nobackup
"set nowritebackup
"
"" You will have bad experience for diagnostic messages when it's default 4000.
"set updatetime=300
"
"" don't give |ins-completion-menu| messages.
"set shortmess+=c
"
"" always show signcolumns
"set signcolumn=yes
"
"" Use tab for trigger completion with characters ahead and navigate.
"" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
"inoremap <silent><expr> <TAB>
"      \ pumvisible() ? "\<C-n>" :
"      \ <SID>check_back_space() ? "\<TAB>" :
"      \ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"
"function! s:check_back_space() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~# '\s'
"endfunction
"
"" Use <c-space> to trigger completion.
"inoremap <silent><expr> <c-space> coc#refresh()
"
"" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
"" Coc only does snippet and additional edit on confirm.
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"" Or use `complete_info` if your vim support it, like:
"" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
"
"" Use `[g` and `]g` to navigate diagnostics
"nmap <silent> [g <Plug>(coc-diagnostic-prev)
"nmap <silent> ]g <Plug>(coc-diagnostic-next)
"
"" Remap keys for gotos
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)
"
"" Use K to show documentation in preview window
"nnoremap <silent> K :call <SID>show_documentation()<CR>
"
"function! s:show_documentation()
"  if (index(['vim','help'], &filetype) >= 0)
"    execute 'h '.expand('<cword>')
"  else
"    call CocAction('doHover')
"  endif
"endfunction
"
"" Highlight symbol under cursor on CursorHold
"autocmd CursorHold * silent call CocActionAsync('highlight')
"
"" Remap for rename current word
"nmap <leader>rn <Plug>(coc-rename)
"
"" Remap for format selected region
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)
"
"augroup mygroup
"  autocmd!
"  " Setup formatexpr specified filetype(s).
"  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"  " Update signature help on jump placeholder
"  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
"augroup end
"
"" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)
"
"" Remap for do codeAction of current line
"nmap <leader>ac  <Plug>(coc-codeaction)
"" Fix autofix problem of current line
"nmap <leader>qf  <Plug>(coc-fix-current)
"
"" Create mappings for function text object, requires document symbols feature of languageserver.
"xmap if <Plug>(coc-funcobj-i)
"xmap af <Plug>(coc-funcobj-a)
"omap if <Plug>(coc-funcobj-i)
"omap af <Plug>(coc-funcobj-a)
"
"" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
"nmap <silent> <C-d> <Plug>(coc-range-select)
"xmap <silent> <C-d> <Plug>(coc-range-select)
"
"" Use `:Format` to format current buffer
"command! -nargs=0 Format :call CocAction('format')
"
"" Use `:Fold` to fold current buffer
"command! -nargs=? Fold :call     CocAction('fold', <f-args>)
"
"" use `:OR` for organize import of current buffer
"command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
"
"" Add status line support, for integration with other plugin, checkout `:h coc-status`
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

"" Using CocList
"" Show all diagnostics
"nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
"" Manage extensions
"nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
"" Show commands
"nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
"" Find symbol of current document
"nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
"" Search workspace symbols
"nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
"" Do default action for next item.
"nnoremap <silent> <space>j  :<C-u>CocNext<CR>
"" Do default action for previous item.
"nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
"" Resume latest coc list
"nnoremap <silent> <space>p  :<C-u>CocListResume<CR>



Plugin 'hashivim/vim-terraform'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LanguageClient                                           "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Required for operations modifying multiple buffers like rename.
"set hidden

"Plugin 'LanguageClient-neovim'
"let g:LanguageClient_serverCommands = {
"    \ 'rust': ['~/.cargo/bin/rls'],
"    \ 'gdscript': ['tcp://localhost:6008'],
"    \ }

"nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
"nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
"nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" rust                                                     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'rust-lang/rust.vim'
let g:rustfmt_autosave = 1
" and toml
Plugin 'cespare/vim-toml'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gpg                                                      "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'jamessan/vim-gnupg'


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
"
"" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

"" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LanguageTool                                             "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Plugin 'vim-scripts/LanguageTool'
set spelllang=en_us
let g:languagetool_jar = '$HOME/LanguageTool-4.5/languagetool-commandline.jar'




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python syntax                                            "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'hdima/python-syntax'
let python_highlight_all = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" rustfmt vim-autoformat                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'Chiel92/vim-autoformat'
let g:formatdef_rustfmt = '"rustfmt"'
let g:formatters_rust = ['rustfmt']


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerdcommenter                                            "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'scrooloose/nerdcommenter'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-motivate                                             "
" https://github.com/onur/vim-motivate                     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'vim-motivate'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-session                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'
let g:session_autoload = 'no'
let g:session_autosave = 'no'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gdscript                                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'quabug/vim-gdscript'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" indent guides                                            "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent = 3


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" auto-close stuff                                         "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Plugin 'jiangmiao/auto-pairs'
"let g:AutoPairs = {'(':')', '[':']', "'":"'",'"':'"', '`':'`'}
"let g:AutoPairsMapSpace = 0
"let g:AutoPairsMapCR = 0


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nord theme                                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'arcticicestudio/nord-vim'



call vundle#end()
filetype plugin indent on

set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'


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
