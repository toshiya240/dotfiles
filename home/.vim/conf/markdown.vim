let s:bundle = neobundle#get('vim-markdown')
if empty(s:bundle)
  finish
endif

function! s:config(bundle)
  let g:vim_markdown_frontmatter=1
endfunction

if s:bundle.lazy
  let s:bundle.hooks.on_source = function('s:config')
else
  call s:config(s:bundle)
endif
