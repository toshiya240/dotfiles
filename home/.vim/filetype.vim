if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au! BufNewFile,BufRead *.fish   setf fish
  au! BufNewFile,BufRead *.md     setf markdown
  au! BufNewFile,BufRead *.coffee setf coffee
  au! BufNewFile,BufRead *.oct    setf octave
augroup END

augroup FileTypeConfig
  au!
  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif

  au FileType *                 setlocal formatoptions=tcrqlmB nocindent    comments& dictionary<
  au FileType vim               setlocal shiftwidth=2
  au FileType zsh               setlocal shiftwidth=2
  au FileType c,cpp             setlocal formatoptions=croqlB  cindent      comments=sr:/*,mb:*,ex:*/,://
  au FileType java              setlocal formatoptions=croqlB  cindent      comments=sr:/*,mb:*,ex:*/,://
  au FileType php               setlocal cindent               shiftwidth=4
  au FileType text              setlocal textwidth=78
  au FileType javascript        setlocal cindent               shiftwidth=2
  au FileType coffee            setlocal shiftwidth=2
  au FileType python            setlocal shiftwidth=4
  au FileType ruby              setlocal shiftwidth=2
  au FileType xml,html,css,yaml setlocal smartindent           shiftwidth=2
  au FileType mail              setlocal tw=60

  " For ChangeLog
  au FileType changelog let g:changelog_username="Toshiya NISHIO <toshiya240@gmail.com>"
  au FileType changelog setlocal noexpandtab

  " quick close
  au FileType qf,help,man nnoremap <buffer> q :bd!<CR>
augroup END
