if exists("b:loaded_wobble_css") || !exists("g:loaded_wobble")
  finish
endif
let b:loaded_wobble_css = 1



call wobble#MapTextObject('vas%ge'           , 'iS')
call wobble#MapTextObject('^vf:'             , 'aP')
call wobble#MapTextObject('^vf:ge'           , 'iP')
call wobble#MapTextObject('^f:lv$'           , 'aV')
call wobble#MapTextObject('^f:wvf;h'         , 'iV')
call wobble#MapTextObject('call wobble#iU()' , 'iU' , '-n')
