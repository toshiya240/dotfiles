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
set fileencodings=ucs-bom,iso-2022-jp,utf-8,euc-jp,cp932
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

augroup vimrc
  au!
  au BufReadPost quickfix set winheight=20

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif
augroup END


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

"" Unite
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'thinca/vim-unite-history'
NeoBundle 'Shougo/tabpagebuffer.vim'

" editing
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'Align'

" devel
NeoBundle 'scrooloose/syntastic'
NeoBundle 'majutsushi/tagbar'
"" git
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'gregsexton/gitv'
NeoBundle 'idanarye/vim-merginal'
NeoBundle 'cohama/agit.vim'

" filetype
NeoBundle 'joker1007/vim-markdown-quote-syntax'
NeoBundle 'rcmdnk/vim-markdown'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'jvirtanen/vim-octave'

" other
NeoBundle 'info.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'Konfekt/FastFold'
NeoBundle 'ryanoasis/vim-devicons'

call neobundle#end()

" enable ftplugin
filetype plugin on
filetype indent on

runtime! conf/*.vim

" syntax highlighting
syntax on
colorscheme mycolor
