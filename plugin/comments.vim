" line commenting macro
function! CommentLine()
  let pos = getpos(".")
  execute ".,.+" . v:count . " normal! I" . b:left_comment_symbol . " "
  call setpos(".", pos)
endfunction

function! UncommentLine()
  let pos = getpos(".")
  execute ".,.+" . v:count . " normal! ^daw"
  call setpos(".", pos)
endfunction

" for commenting blocks in html/css
function! CommentBlock()
  let pos = getpos(".")
  if v:count is 0
    execute "normal! I" . b:left_comment_symbol . " "
    execute "normal! A " . b:right_comment_symbol
  else
    let lines = v:count + 1
    execute "normal! O"
    execute "normal! i" . b:left_comment_symbol
    execute ".+" . lines . "norm o"
    execute "normal! i" . b:right_comment_symbol
  endif
  call setpos(".", pos)
endfunction

function! UncommentBlock()
  let pos = getpos(".")
  if v:count is 0
    execute "norm ^daw" 
    execute "norm $daw"
  else
    let lines = v:count - 1
    execute ". norm dd"
    execute ".+" . lines . "norm dd"
    execute ".-" . lines . "norm ^"
  endif
  call setpos(".", pos)
endfunction
