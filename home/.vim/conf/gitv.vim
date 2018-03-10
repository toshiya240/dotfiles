let s:bundle = neobundle#get('gitv')
if empty(s:bundle)
  finish
endif

function! s:config(bundle)
  let g:Gitv_OpenHorizontal=1
  let g:Gitv_WrapLines=1 
  let g:Gitv_TruncateCommitSubjects=1
  let g:Gitv_OpenPreviewOnLaunch=1
endfunction

if s:bundle.lazy
  let s:bundle.hooks.on_source = function('s:config')
else
  call s:config(s:bundle)
endif
