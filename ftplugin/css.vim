if exists("b:loaded_wobble_css") || !exists("g:loaded_wobble")
  finish
endif
let b:loaded_wobble_css = 1



if g:wobble_add_keywords
  " Keep multi-word CSS keywords together (`sans-serif`)
  setlocal iskeyword+=-
  " Keep decimal numbers together (`1.5`)
  setlocal iskeyword+=.
  " Keep percentage unit together with number (`100%`)
  setlocal iskeyword+=%
  " Keep media queries etc. together (`@media`)
  setlocal iskeyword+=@
  " Keep hex colors together (`#abcdef`)
  setlocal iskeyword+=#
endif



call wobble#MapTextObject('vas%ge'              , 'iSelector' , 'iS')

call wobble#MapTextObject('^vf:'                , 'aProperty' , 'aP')
call wobble#MapTextObject('^vf:ge'              , 'iProperty' , 'iP')
call wobble#MapTextObject('^f:lv$'              , 'aValue'    , 'aV')
call wobble#MapTextObject('^f:wvf;ge'           , 'iValue'    , 'iV')

call wobble#MapTextObject('call wobble#iUnit()' , 'iUnit'     , 'iU' , '-n')
