" ============================================================================
" File:        slashcomment.vim
" Description: slash comment works like eclipse.
" Maintainer:  Takahiro Sasaki <jjjeebbb at gmail dot com>
" Version:     1.0.0
" Last Change: 16th May, 2015
" License:     This file is placed in the public domain.
"
" ============================================================================
if exists("loaded_slash_comment")
  finish
endif

let loaded_slash_comment="1"

noremap <silent> <C-C> :call SlashComment()<CR>
inoremap <silent> <C-C> <ESC>:call SlashComment()<CR>a
vnoremap <silent> <C-C> :call SlashComment()<CR>

function! SlashComment()
  let col_num = col(".")
"  let file_name = buffer_name("%")
"  if file_name =~ '\.\(\cc\|cpp\|hpp\|java\)$'
    call cursor(line("."), 9999)
    if search("^[ 	]*\/\/",'b',line("."))
      execute ":,,s/\\/\\//"
      if col_num > 2
        call cursor(line("."), col_num - 2)
      else
        call cursor(line("."), 1)
      endif
    else
      execute ":silent! normal 0i//\<ESC>0"
      if col_num > 1
        call cursor(line("."), col_num + 2)
      else
        call cursor(line("."), 1)
      endif
    endif
"  endif
endfunction
