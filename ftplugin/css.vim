if exists("b:loaded_wobble_css") || !exists("g:loaded_wobble")
  finish
endif
let b:loaded_wobble_css = 1



call wobble#MapTextObject('vas%ge'              , 'iSelector' , 'iS')

call wobble#MapTextObject('^vf:'                , 'aProperty' , 'aP')
call wobble#MapTextObject('^vf:ge'              , 'iProperty' , 'iP')
call wobble#MapTextObject('^f:lv$'              , 'aValue'    , 'aV')
call wobble#MapTextObject('^f:wvf;ge'           , 'iValue'    , 'iV')

call wobble#MapTextObject('call wobble#iUnit()' , 'iUnit'     , 'iU' , '-n')
