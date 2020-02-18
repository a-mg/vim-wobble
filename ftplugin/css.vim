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

call wobble#MapTextObject('vas%ge'              , 'iSelector' , 'iS' , 1 , 0)

call wobble#MapTextObject('^vf:'                , 'aProperty' , 'aP' , 1 , 0)
call wobble#MapTextObject('^vf:ge'              , 'iProperty' , 'iP' , 1 , 0)
call wobble#MapTextObject('^f:lv$'              , 'aValue'    , 'aV' , 1 , 0)
call wobble#MapTextObject('^f:wvf;ge'           , 'iValue'    , 'iV' , 1 , 0)

call wobble#MapTextObject('call wobble#iUnit()' , 'iUnit'     , 'iU' , 0 , 0)
