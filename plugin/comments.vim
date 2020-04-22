" line commenting macro
function CommentLine ()
  let pos = getpos(".")
  execute ".,.+" . v:count . " norm 0i" . b:left_comment_symbol . " "
  call setpos(".", pos)
endfunction

function UncommentLine ()
  let pos = getpos(".")
  execute ".,.+" . v:count . " norm 0daw"
  call setpos(".", pos)
endfunction

" for commenting blocks in html/css
function CommentBlock ()
  let pos = getpos(".")
  if v:count is 0
    execute "norm I" . b:left_comment_symbol . " "
    execute "norm A " . b:right_comment_symbol
  else
    let lines = v:count + 1
    execute "norm O"
    execute "norm 0i" . b:left_comment_symbol
    execute ".+" . lines . "norm o"
    execute "norm 0i" . b:right_comment_symbol
  endif
  call setpos(".", pos)
endfunction

function UncommentBlock ()
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
