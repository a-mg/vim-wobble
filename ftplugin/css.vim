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



function! s:MapTextObject(sequence, plug, map)
  let plugstring = 'noremap <silent><buffer> <Plug>WobbleCSS_' . a:plug . ' :<c-u>normal! ' . a:sequence . '<cr>'
  execute 'o' . plugstring
  execute 'x' . plugstring

  if g:wobble_map_textobjects
    let mapstring = 'map <silent><buffer> ' . a:map . ' <Plug>WobbleCSS_' . a:plug
    execute 'o' . mapstring
    execute 'x' . mapstring
  endif
endfunction

call s:MapTextObject('vas'       , 'aBlock'    , 'acb')
call s:MapTextObject('][vib'     , 'iBlock'    , 'icb')

call s:MapTextObject('(][%ge'    , 'iSelector' , 'ics')

call s:MapTextObject('^vf:'      , 'aProperty' , 'acp')
call s:MapTextObject('^vf:ge'    , 'iProperty' , 'icp')
call s:MapTextObject('^f:lv$'    , 'aValue'    , 'acv')
call s:MapTextObject('^f:wvf;ge' , 'iValue'    , 'icv')



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

onoremap <silent><buffer> <Plug>WobbleCSS_iUnit :<c-u>call <SID>UnitTextObject()<cr>
xnoremap <silent><buffer> <Plug>WobbleCSS_iUnit :<c-u>call <SID>UnitTextObject()<cr>

if g:wobble_map_textobjects
  omap <silent><buffer> icu <Plug>WobbleCSS_iUnit
  xmap <silent><buffer> icu <Plug>WobbleCSS_iUnit
endif
