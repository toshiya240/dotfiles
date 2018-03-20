try
  let g:unite_source_rec_async_command=['ag', '--nocolor', '--nogroup', '--hidden', '-g', '']
  call unite#filters#matcher_default#use(['matcher_fuzzy'])
catch
endtry
