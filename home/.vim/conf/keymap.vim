nnoremap Y y$
inoremap <C-f> <Right>
inoremap <C-b> <Left>

" for command line 
cnoremap <C-a> <Home>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>

" Don't use Ex mode, use Q for formatting
map Q gq

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvs<C-R>=current_reg<CR><Esc>

" hlsearch
nnoremap <silent><C-l> :<C-u>nohlsearch<CR><C-l>

" toggle spell
nnoremap <silent><leader>s :<C-u>set spell!<CR>:set spell?<CR>

" grep
nnoremap <silent><leader>/ :grep <C-r><C-w><CR>

if dein#tap('denite.nvim')
  nnoremap <silent><leader>f :<C-u>Denite file -buffer-name=file<CR>
  nnoremap <silent><leader>F :<C-u>Denite file -buffer-name=file -input=`expand('%:h')`/<CR>
  nnoremap <silent><leader><space> :<C-u>Denite file_rec<CR>
  nnoremap <silent><leader>b :<C-u>Denite buffer -buffer-name=buffer<CR>
  nnoremap <silent><leader>R :<C-u>Denite register -buffer-name=register<CR>
  nnoremap <silent><leader>k :<C-u>Denite bookmark -buffer-name=bookmark<CR>
  nnoremap <silent><leader>o :<C-u>Denite outline -buffer-name=outline<CR>
endif
if dein#tap('neomru.vim')
  nnoremap <silent><leader>r :<C-u>Denite file_mru -buffer-name=file_mru<CR>
endif

if dein#tap('neocomplete')
  inoremap <expr><C-g>     neocomplete#undo_completion()
  inoremap <expr><C-l>     neocomplete#complete_common_string()

  "" Recommended key-mappings.
  "" <CR>: close popup and save indent.
  inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
  function! s:my_cr_function()
      return neocomplete#close_popup() . "\<CR>"
      " For no inserting <CR> key.
      "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
  endfunction
  "" <TAB>: completion.
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
  "" <C-h>, <BS>: close popup and delete backword char.
  inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><C-y>  neocomplete#close_popup()."\<C-y>"
  inoremap <expr><C-e>  neocomplete#cancel_popup()."\<C-e>"
  "" Close popup by <Space>.
  "inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() :
  "\<Space>"
endif

" neosnippet
if dein#tap('neosnippet')
  imap <C-k>     <Plug>(neosnippet_expand_or_jump)
  smap <C-k>     <Plug>(neosnippet_expand_or_jump)
  xmap <C-k>     <Plug>(neosnippet_expand_target)

  "" SuperTab like snippets behavior.
  imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)"
  \: pumvisible() ? "\<C-n>" : "\<TAB>"
  smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)"
  \: "\<TAB>"
endif
