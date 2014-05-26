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
" NeoBundle
if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Bundles
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'rcmdnk/vim-markdown'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'autodate.vim'
NeoBundle 'info.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'gcmt/wildfire.vim'

" enable ftplugin
filetype plugin on
filetype indent on

"----------------------------------------------------------------------
" neocomplcache

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
            \ 'default' : '',
            \ 'vimshell' : $HOME.'/.vimshell_hist',
            \ 'scheme' : $HOME.'/.gosh_completions'
            \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return neocomplete#close_popup() . "\<CR>"
    " For no inserting <CR> key.
    "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() :
"\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:]*\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:]*\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

"----------------------------------------------------------------------
" neosnippet

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
    set conceallevel=2 concealcursor=i
endif

let g:neosnippet#snippets_directory='~/.vim/snippets'

"----------------------------------------------------------------------
" lightline
set t_Co=256
let g:lightline = {
      \ 'colorscheme': 'landscape',
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename', 'tagname' ] ]
      \ },
      \ 'component_function': {
      \   'modified': 'MyModified',
      \   'readonly': 'MyReadonly',
      \   'fugitive': 'MyFugitive',
      \   'filename': 'MyFilename',
      \   'tagname': 'MyTagname',
      \   'fileformat': 'MyFileformat',
      \   'filetype': 'MyFiletype',
      \   'fileencoding': 'MyFileencoding',
      \   'mode': 'MyMode',
      \ },
      \ 'separator': { 'left': "\u2B80", 'right': "\u2B82" },
      \ 'subseparator': { 'left': "\u2B81", 'right': "\u2B83" }
      \ }

function! MyModified()
    return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
    return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? "\u2B64" : ''
endfunction

function! MyFilename()
    return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
                \ (&ft == 'vimfiler' ? vimfiler#get_status_string() : 
                \  &ft == 'unite' ? unite#get_status_string() : 
                \  &ft == 'vimshell' ? vimshell#get_status_string() :
                \ '' != expand('%:p:.') ? expand('%:p:.') : '[No Name]') .
                \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyTagname()
    return tagbar#currenttag('%s', '')
endfunction

function! MyFugitive()
    if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
        let _ = fugitive#head()
        return strlen(_) ? "\u2B60 "._ : ''
    endif
    return ''
endfunction

function! MyFileformat()
    return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ?  &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
    return winwidth(0) > 70 ? (strlen(&fenc) ?  &fenc : &enc) : ''
endfunction

function! MyMode()
    return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

"----------------------------------------------------------------------
" wildfire
" This selects the next closest text object.
let g:wildfire_fuel_map = "<S-ENTER>"

" This selects the previous closest text object.
let g:wildfire_water_map = "<BS>"

"" use '*' to mean 'all other filetypes'
"" in this example, html and xml share the same text objects
"let g:wildfire_objects = {
"    \ "*" : ["i'", 'i"', "i)", "i]", "i}", "ip"],
"    \ "html,xml" : ["at"],
"    \ }

"----------------------------------------------------------------------
" ファイル関連
" バックアップファイルを作成しない
set nobackup
" スワップファイルを作成しない
set noswapfile

"----------------------------------------------------------------------
" 画面表示関係
"
set number
set cursorline
set ruler				" show the cursor position all the time
set showcmd				" display incomplete commands
set laststatus=2		" show the status line all the time
set cmdheight=2
set ambiwidth=double    " for characters with East Asian Width Class Ambiguous

function ModifiedStatus()
    let sts = ""
    if &readonly
        let sts = sts . "%"
    endif
    if &modified
        let sts = sts . "*"
    else
        let sts = sts . "-"
    endif
    return sts
endfunction

set statusline=%<[%2*%{ModifiedStatus()}%*]%f[%1*%{&fileencoding}/%{&fileformat}%*](%2*%Y%*)%=%l,%c%V\ %P

set showmatch			" 閉じ括弧が挿入されたときに、一瞬対応する括弧にジャンプする

" syntax highlighting
syntax on
colorscheme mycolor


" text wrapping
set nowrap

set scrolloff=5

set listchars=eol:$,tab:>-

"----------------------------------------------------------------------
" search
"
set incsearch		" do incremental searching
set nowrapscan
set ignorecase
set smartcase

"----------------------------------------------------------------------
" 編集関係
"
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
" indent
set expandtab
set tabstop=4
"set softtabstop=4
set autoindent		" always set autoindenting on
set cindent shiftwidth=4
set cinkeys=0{,0},0),0:,0#,!<Tab>,!^F,o,O,e

set history=50		" keep 50 lines of command line history

" mouse の動作を MS-Windows のようにする
behave mswin

"----------------------------------------------------------------------
" key bind
nnoremap <Space> <PageDown>
nnoremap <S-Space> <PageUp>
"nnoremap <BS>    <PageUp>
nnoremap <C-h>   <PageUp>
nnoremap <C-f>   <Right>
nnoremap <C-b>   <Left>

vnoremap <Space> <PageDown>
"vnoremap <BS>    <PageUp>
vnoremap <C-h>   <PageUp>
vnoremap <C-f>   <Right>
vnoremap <C-b>   <Left>

" for command line 
cnoremap <C-a> <Home>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>

" Don't use Ex mode, use Q for formatting
map Q gq

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvs<C-R>=current_reg<CR><Esc>

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Unite
"nnoremap <silent><leader>g :<C-u>Unite grep<CR>
nnoremap <leader>g :grep 
nnoremap <silent><leader>k :<C-u>Unite bookmark -buffer-name=bookmark<CR>
nnoremap <silent><leader>r :<C-u>Unite file_mru -buffer-name=file_mru<CR>
nnoremap <silent><leader>f :<C-u>Unite -start-insert file -buffer-name=file<CR>
nnoremap <silent><leader>b :<C-u>Unite buffer -buffer-name=buffer<CR>
nnoremap <silent><leader>R :<C-u>Unite register -buffer-name=register<CR>
nnoremap <silent><leader>o :<C-u>Unite outline<CR>

au BufReadPost quickfix set winheight=20

"----------------------------------------------------------------------
" file type

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  autocmd FileType *     set formatoptions=tcrqlmB nocindent comments&
  autocmd FileType c,cpp set formatoptions=croqlB cindent comments=sr:/*,mb:*,ex:*/,://
  autocmd FileType java set formatoptions=croqlB cindent comments=sr:/*,mb:*,ex:*/,://
  autocmd FileType php set cindent shiftwidth=4
  autocmd FileType text setlocal textwidth=78
  autocmd FileType javascript set cindent shiftwidth=4
  autocmd FileType python set shiftwidth=4
  autocmd FileType ruby set shiftwidth=2
  autocmd FileType xml,html,css,yaml set smartindent shiftwidth=2
  autocmd FileType mail set tw=60

  augroup numberwidth
      autocmd!
      autocmd BufEnter,WinEnter,BufWinEnter * let &l:numberwidth = len(line("$")) + 2
  augroup END

  " For ChangeLog
  autocmd FileType changelog let g:changelog_username="Toshiya NISHIO <toshiya240@gmail.com>"
  autocmd FileType changelog set noexpandtab

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

endif " has("autocmd")

"----------------------------------------------------------------------
" macros

" man
source $VIMRUNTIME/ftplugin/man.vim
set keywordprg=man
" autodate
"" フォーマットを指定する
:let autodate_format = '%Y/%m/%d %H:%M:%S'
" 最後の10行でも Autodate が動くようにする
" エラーが出るのでコメントアウト。必要性も疑問だし。
"if has("autocmd")
"  augroup Autodate
"    au!
"    autocmd BufUnload,FileWritePre,VimLeavePre,BufWritePre * 
"      \:$-10,$Autodate<CR>
"  augroup END
"endif " has("autocmd")

" ToggleCommentify
map <M-c> :call ToggleCommentify()<CR>j
imap <M-c> <ESC>:call ToggleCommentify()<CR>j

" for :TOhtml
let g:html_use_css = 0
let g:html_use_xhtml = 1
let g:html_number_lines = 0
" これを 1 にすると CSS が生成されてしまう模様
let g:html_dynamic_folds = 0

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
map <leader>d :call SearchDash()<CR>
