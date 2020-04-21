" indentation settings
setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=2

" recompile latex document on write, stop compilation if there's an error
" redraw redraws the screen to flush command output
autocmd BufWritePost *.tex silent! execute "!pdflatex -output-directory '%:p:h' %" | redraw!

" latex snippets

" latex template
nnoremap ,tplt :-1read $HOME/.vim/snippets/latex/template<CR>5j
" for align*
nnoremap ,al :-1read $HOME/.vim/snippets/latex/align<CR>ji
" for anonymous equations (\[ \])
nnoremap ,mm :-1read $HOME/.vim/snippets/latex/nolabel_math<CR>2la
" for itemize
nnoremap ,it :-1read $HOME/.vim/snippets/latex/itemize<CR>jA
" for enumerate
nnoremap ,en :-1read $HOME/.vim/snippets/latex/enumerate<CR>jA

" works similar to the autocmd above, but latex needs pdflatex, bibtex, pdflatex
" pdflatex in order to format bibliographies correctly, takes a while so
" encapsulate in a function
function BibliographyCompilation() 
    silent! execute "!pdflatex -output-directory '%:p:h' %; bibtex '%:r'.aux; pdflatex -output-directory '%:p:h' %; pdflatex -output-directory '%:p:h' %" | redraw!
endfunction

function OpenPDF()
    silent! execute "!open '%:r'.pdf" | redraw!
endfunction

" call function with leader key
nnoremap ,b :call BibliographyCompilation()<CR>
nnoremap ,o :call OpenPDF()<CR>
