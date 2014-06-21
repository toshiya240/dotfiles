" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  autocmd FileType *     set formatoptions=tcrqlmB nocindent comments&
  autocmd FileType vim set shiftwidth=2
  autocmd FileType c,cpp set formatoptions=croqlB cindent comments=sr:/*,mb:*,ex:*/,://
  autocmd FileType java set formatoptions=croqlB cindent comments=sr:/*,mb:*,ex:*/,://
  autocmd FileType php set cindent shiftwidth=4
  autocmd FileType text setlocal textwidth=78
  autocmd FileType javascript set cindent shiftwidth=2
  autocmd FileType coffee set shiftwidth=2
  autocmd FileType python set shiftwidth=4
  autocmd FileType ruby set shiftwidth=2
  autocmd FileType xml,html,css,yaml set smartindent shiftwidth=2
  autocmd FileType mail set tw=60

  " For ChangeLog
  autocmd FileType changelog let g:changelog_username="Toshiya NISHIO <toshiya240@gmail.com>"
  autocmd FileType changelog set noexpandtab

endif " has("autocmd")
