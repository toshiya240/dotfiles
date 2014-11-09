" vimrc file.

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif
 
" vi 非互換モードにする
set nocompatible

"----------------------------------------------------------------------
" 日本語を扱うために
"
"set fileencodings=iso-2022-jp,utf-8,cp932
set fileencodings=ucs-bom,iso-2022-jp,utf-8,euc-jp,cp932
set iminsert=0
set imsearch=0

set encoding=utf-8
scriptencoding utf-8

"----------------------------------------------------------------------
" ファイル関連
set nobackup
set noswapfile
set noundofile

"----------------------------------------------------------------------
" 画面表示関係
"
set number
augroup numberwidth
  autocmd!
  autocmd BufEnter,WinEnter,BufWinEnter * let &l:numberwidth = len(line("$")) + 2
augroup END
set cursorline
set ruler				" show the cursor position all the time
set showcmd				" display incomplete commands
set laststatus=2		" show the status line all the time
set cmdheight=2
set ambiwidth=double    " for characters with East Asian Width Class Ambiguous
set showmatch			" 閉じ括弧が挿入されたときに、一瞬対応する括弧にジャンプする
set nowrap
set linebreak
set scrolloff=5
set listchars=eol:$,tab:>-

" syntax highlighting
syntax on
colorscheme mycolor


au BufReadPost quickfix set winheight=20

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "normal g`\"" |
\ endif

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

set history=50

" mouse の動作を MS-Windows のようにする
behave mswin

source $VIMRUNTIME/macros/matchit.vim
augroup matchit
  au!
  au FileType ruby let b:match_words = '\<\(module\|class\|def\|begin\|do\|if\|unless\|case\)\>:\<\(elsif\|when\|rescue\)\>:\<\(else\|ensure\)\>:\<end\>'
augroup END

"----------------------------------------------------------------------
" misc

set helplang=en,ja

" man
source $VIMRUNTIME/ftplugin/man.vim
set keywordprg=man
" autodate
"" フォーマットを指定する
let autodate_format = '%Y/%m/%d %H:%M:%S'

" Open in Marked
command OpenInMarked !open -a Marked %:p
map <leader>m :OpenInMarked<CR>

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
" NeoBundle
if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Bundles
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'thinca/vim-unite-history'
NeoBundle 'sgur/unite-qf'
NeoBundle 'rcmdnk/vim-markdown'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'autodate.vim'
NeoBundle 'info.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'gcmt/wildfire.vim'
NeoBundle 'kchmck/vim-coffee-script'

call neobundle#end()

" enable ftplugin
filetype plugin on
filetype indent on

runtime! conf/*.vim
