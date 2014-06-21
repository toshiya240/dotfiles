nnoremap <Space> <PageDown>
nnoremap <S-Space> <PageUp>
"nnoremap <BS>    <PageUp>
nnoremap <C-h>   <PageUp>

vnoremap <Space> <PageDown>
"vnoremap <BS>    <PageUp>
vnoremap <C-h>   <PageUp>

inoremap <C-f> <Right>
inoremap <C-b> <Left>

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
nnoremap <silent><leader>u :<C-u>Unite -start-insert source -buffer-name=source<CR>
nnoremap <silent><leader>f :<C-u>Unite -start-insert file -buffer-name=file<CR>
nnoremap <silent><leader>b :<C-u>Unite -start-insert buffer -buffer-name=buffer<CR>
nnoremap <silent><leader>g :<C-u>Unite grep -no-quit -keep-focus -buffer-name=grep<CR>
nnoremap <silent><leader>r :<C-u>Unite file_mru -buffer-name=file_mru<CR>
nnoremap <silent><leader>R :<C-u>Unite register -buffer-name=register<CR>
nnoremap <silent><leader>o :<C-u>Unite outline -buffer-name=outline<CR>
nnoremap <silent><leader>q :<C-u>Unite qf -buffer-name=qf<CR>
nnoremap <silent><leader>k :<C-u>Unite bookmark -buffer-name=bookmark<CR>
