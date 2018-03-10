let s:bundle = neobundle#get('neosnippet')
if empty(s:bundle)
  finish
endif

function! s:config(bundle)
  " For snippet_complete marker.
  if has('conceal')
      set conceallevel=2 concealcursor=i
  endif

  let g:neosnippet#snippets_directory='~/.vim/snippets'
endfunction

if s:bundle.lazy
  let s:bundle.hooks.on_source = function('s:config')
else
  call s:config(s:bundle)
endif
