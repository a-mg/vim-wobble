if exists("b:loaded_wobble_html") || !exists("g:loaded_wobble")
  finish
endif
let b:loaded_wobble_html = 1



if g:wobble_add_keywords
  " Keep multi-word attributes together (`data-name`)
  setlocal iskeyword+=-
  " Keep decimal numbers together (`1.5`)
  setlocal iskeyword+=.
endif



call wobble#MapTextObject('f"F=F v2f"'                   , 'aAttr'     , 'aA')
call wobble#MapTextObject('f"F=T vt='                    , 'iName'     , 'iN')
call wobble#MapTextObject('f"F=f"lvi"'                   , 'iValue'    , 'iV')

call wobble#MapTextObject('vato\ef vt>'                  , 'aTagAttrs' , 'aL' , '+e')
call wobble#MapTextObject('vato\ef lvt>'                 , 'iTagAttrs' , 'iL' , '+e')

call wobble#MapTextObject('vato\e/class\r:noh\rF v2f\"'  , 'aClass'    , 'aC' , '+e')
call wobble#MapTextObject('vato\e/class\r:noh\rf\"lvi\"' , 'iClass'    , 'iC' , '+e')

call wobble#MapTextObject('vato\e/id\r:noh\rF v2f\"'     , 'aID'       , 'aI' , '+e')
call wobble#MapTextObject('vato\e/id\r:noh\rf\"lvi\"'    , 'iID'       , 'iI' , '+e')

call wobble#MapTextObject('vi<geowo'                     , 'iComment'  , 'ic')



call wobble#MapLocalLeader('vato<esc>f>i<space>'                         , 'appendTagAttrs' , 'aL')
call wobble#MapLocalLeader('vato<esc>/[ \>]<cr>:noh<cr>i class=""<esc>i' , 'insertClass'    , 'iC')
call wobble#MapLocalLeader('vato<esc>/class<cr>:noh<cr>2f"i<space>'      , 'appendClass'    , 'aC')
call wobble#MapLocalLeader('vato<esc>/[ \>]<cr>:noh<cr>i id=""<esc>i'    , 'insertID'       , 'iI')
