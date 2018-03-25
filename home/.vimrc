" vimrc file.
set encoding=utf-8
scriptencoding utf-8

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

let mapleader="\<Space>"
 
"----------------------------------------------------------------------
" 日本語を扱うために
"
set fileencodings=ucs-bom,utf-8,iso-2022-jp,euc-jp,cp932
set iminsert=0
set imsearch=0


"----------------------------------------------------------------------
" ファイル関連
set nobackup
set swapfile
set directory=~/.vim/tmp/swap//
set undofile
set undodir=~/.vim/tmp/undo

"----------------------------------------------------------------------
" 画面表示関係
"
set t_Co=256
set nonumber
augroup numberwidth
  autocmd!
  autocmd BufEnter,WinEnter,BufWinEnter * let &l:numberwidth = len(line("$")) + 2
augroup END
set cursorline
set ruler				" show the cursor position all the time
set showcmd				" display incomplete commands
set laststatus=2		" show the status line all the time
set showtabline=2
set cmdheight=2
set pumheight=10
set ambiwidth=double    " for characters with East Asian Width Class Ambiguous
set showmatch			" 閉じ括弧が挿入されたときに、一瞬対応する括弧にジャンプする
set matchtime=1
set nowrap
set display=lastline
set linebreak
set scrolloff=5
set listchars=eol:$,tab:>-

set hlsearch

" Insert モードでカーソル形状変更
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

"----------------------------------------------------------------------
" search
"
set incsearch
set nowrapscan
set ignorecase
set smartcase

"----------------------------------------------------------------------
" 編集関係
"
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set expandtab
set tabstop=4
set autoindent
set cindent shiftwidth=4
set cinkeys=0{,0},0),0:,0#,!<Tab>,!^F,o,O,e

set history=100

" mouse の動作を MS-Windows のようにする
behave mswin

source $VIMRUNTIME/macros/matchit.vim
augroup matchit
  au!
  au FileType ruby let b:match_words = '\<\(module\|class\|def\|begin\|do\|if\|unless\|case\)\>:\<\(elsif\|when\|rescue\)\>:\<\(else\|ensure\)\>:\<end\>'
augroup END

" dict
set dictionary+=/usr/share/dict/words
set dictionary+=/usr/share/dict/connectives

"----------------------------------------------------------------------
" misc

set helplang=en,ja
set spelllang=en,cjk

" grep
set grepprg=ag\ --vimgrep\ $*
set grepformat=%f:%l:%c:%m
autocmd QuickFixCmdPost *grep* cwindow

" man
source $VIMRUNTIME/ftplugin/man.vim
" autodate
"" フォーマットを指定する
let autodate_format = '%Y/%m/%d %H:%M:%S'

" Open in Marked
function! OpenInMarked()
  silent !open -a Marked %:p
  redraw!
endfunction
map <leader>m :call OpenInMarked()<CR>

" Search Dash for word under cursor
function! SearchDash()
  let s:browser = "/usr/bin/open"
  let s:wordUnderCursor = expand("<cword>")
  let s:url = "dash://".s:wordUnderCursor
  let s:cmd ="silent ! " . s:browser . " " . s:url
  execute s:cmd
  redraw!
endfunction
map <silent><leader>d :call SearchDash()<CR>

"----------------------------------------------------------------------
" dein
if &compatible
  set nocompatible
endif
let g:dein_base_dir = expand('~/.vim/dein')
execute 'set runtimepath+=' . g:dein_base_dir . '/repos/github.com/Shougo/dein.vim'

if dein#load_state(g:dein_base_dir)
  call dein#begin(g:dein_base_dir)

  call dein#load_toml(g:dein_base_dir . '/conf/plugins.toml',  {'lazy': 0})
  call dein#load_toml(g:dein_base_dir . '/conf/filetype.toml', {'lazy': 1})
  call dein#load_toml(g:dein_base_dir . '/conf/insmode.toml',  {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

" enable ftplugin
filetype plugin on
filetype indent on

runtime! conf/*.vim

" syntax highlighting
syntax on
colorscheme mycolor
