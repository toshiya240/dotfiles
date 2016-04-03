" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  autocmd FileType *                 setlocal formatoptions=tcrqlmB nocindent    comments&
  autocmd FileType vim               setlocal shiftwidth=2
  autocmd FileType c,cpp             setlocal formatoptions=croqlB  cindent      comments=sr:/*,mb:*,ex:*/,://
  autocmd FileType java              setlocal formatoptions=croqlB  cindent      comments=sr:/*,mb:*,ex:*/,://
  autocmd FileType php               setlocal cindent               shiftwidth=4
  autocmd FileType text              setlocal textwidth=78
  autocmd FileType javascript        setlocal cindent               shiftwidth=2
  autocmd FileType coffee            setlocal shiftwidth=2
  autocmd FileType python            setlocal shiftwidth=4
  autocmd FileType ruby              setlocal shiftwidth=2
  autocmd FileType xml,html,css,yaml setlocal smartindent           shiftwidth=2
  autocmd FileType mail              setlocal tw=60

  " For ChangeLog
  autocmd FileType changelog let g:changelog_username="Toshiya NISHIO <toshiya240@gmail.com>"
  autocmd FileType changelog setlocal noexpandtab

endif " has("autocmd")
