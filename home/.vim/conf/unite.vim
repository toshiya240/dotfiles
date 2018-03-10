let s:bundle = neobundle#get('unite.vim')
if empty(s:bundle)
  finish
endif

function! s:config(bundle)
  try
    let g:unite_source_rec_async_command=['ag', '--nocolor', '--nogroup', '--hidden', '-g', '']
    call unite#filters#matcher_default#use(['matcher_fuzzy'])
  catch
  endtry
endfunction

if s:bundle.lazy
  let s:bundle.hooks.on_source = function('s:config')
else
  call s:config(s:bundle)
endif
