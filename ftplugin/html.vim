if exists("b:did_wobble_html")
  finish
endif
let b:did_wobble_html = 1



if g:wobble_add_keywords
  " Keep multi-word attributes together (`data-name`)
  setlocal iskeyword+=-
  " Keep decimal numbers together (`1.5`)
  setlocal iskeyword+=.
endif



call wobble#MapTextObject('f"F=F v2f"'                   , 'aAttr'     , 'aA' , 0)
call wobble#MapTextObject('f"F=T vt='                    , 'iName'     , 'iN' , 0)
call wobble#MapTextObject('f"F=f"lvi"'                   , 'iValue'    , 'iV' , 0)

call wobble#MapTextObject('vato\ef vt>'                  , 'aTagAttrs' , 'aL' , 1)
call wobble#MapTextObject('vato\ef lvt>'                 , 'iTagAttrs' , 'iL' , 1)

call wobble#MapTextObject('vato\e/class\r:noh\rF v2f\"'  , 'aClass'    , 'aC' , 1)
call wobble#MapTextObject('vato\e/class\r:noh\rf\"lvi\"' , 'iClass'    , 'iC' , 1)

call wobble#MapTextObject('vato\e/id\r:noh\rF v2f\"'     , 'aID'       , 'aI' , 1)
call wobble#MapTextObject('vato\e/id\r:noh\rf\"lvi\"'    , 'iID'       , 'iI' , 1)



call wobble#MapLocalLeader('vato<esc>f>i<space>'                         , 'appendTagAttrs' , 'aL')
call wobble#MapLocalLeader('vato<esc>/[ \>]<cr>:noh<cr>i class=""<esc>i' , 'insertClass'    , 'iC')
call wobble#MapLocalLeader('vato<esc>/class<cr>:noh<cr>2f"i<space>'      , 'appendClass'    , 'aC')
call wobble#MapLocalLeader('vato<esc>/[ \>]<cr>:noh<cr>i id=""<esc>i'    , 'insertID'       , 'iI')
