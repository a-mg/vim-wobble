if exists("b:did_wobble_css")
  finish
endif
let b:did_wobble_css = 1



if g:wobble_add_keywords
  " Keep multi-word CSS keywords together (`sans-serif`)
  setlocal iskeyword+=-
  " Keep decimal numbers together (`1.5`)
  setlocal iskeyword+=.
  " Keep percentage unit together with number (`100%`)
  setlocal iskeyword+=%
  " Keep media queries etc. together (`@media`)
  setlocal iskeyword+=@
endif



" call wobble#MapTextObject('vas'       , 'aBlock'    , 'acb', 0)
" call wobble#MapTextObject('][vib'     , 'iBlock'    , 'icb', 0)

call wobble#MapTextObject('(][%ge'    , 'iSelector' , 'iS', 0)

call wobble#MapTextObject('^vf:'      , 'aProperty' , 'aP', 0)
call wobble#MapTextObject('^vf:ge'    , 'iProperty' , 'iP', 0)
call wobble#MapTextObject('^f:lv$'    , 'aValue'    , 'aV', 0)
call wobble#MapTextObject('^f:wvf;ge' , 'iValue'    , 'iV', 0)



function! s:UnitTextObject()
  " Select the word and move cursor to start of selection
  normal! viwo
  " Walk forward (deselecting) until cursor is not over a number
  while getline('.')[col('.') - 1] =~# '\v[0-9\-\.]'
    normal! l
  endwhile
  " Move the cursor to the end of selection
  normal! o
endfunction

onoremap <silent><buffer> <Plug>Wobble_iUnit :<c-u>call <SID>UnitTextObject()<cr>
xnoremap <silent><buffer> <Plug>Wobble_iUnit :<c-u>call <SID>UnitTextObject()<cr>

if g:wobble_map_textobjects
  omap <silent><buffer> iU <Plug>Wobble_iUnit
  xmap <silent><buffer> iU <Plug>Wobble_iUnit
endif
