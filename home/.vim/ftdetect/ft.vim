" text file
au! BufNewFile,BufRead *.txt setf text
" Add doxygen file
au! BufNewFile,BufRead *.dox setf cpp
" Add bison cpp
au! BufNewFile,BufRead *.ypp setf yacc
" Markdown
au! BufNewFile,BufRead *.md setf Markdown
