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



call wobble#MapTextObject('f"F=F v2f"'                   , 'aAttrOne'  , 'a~a' , 0)
call wobble#MapTextObject('f"F=T vt='                    , 'iName'     , 'i~n' , 0)
call wobble#MapTextObject('f"F=f"lvi"'                   , 'iValue'    , 'i~v' , 0)

call wobble#MapTextObject('vato\ef vt>'                  , 'aAttrList' , 'a~l' , 1)
call wobble#MapTextObject('vato\ef lvt>'                 , 'iAttrList' , 'i~l' , 1)

call wobble#MapTextObject('vato\e/class\r:noh\rF v2f\"'  , 'aClass'    , 'a~c' , 1)
call wobble#MapTextObject('vato\e/class\r:noh\rf\"lvi\"' , 'iClass'    , 'i~c' , 1)

call wobble#MapTextObject('vato\e/id\r:noh\rF v2f\"'     , 'aID'       , 'a~i' , 1)
call wobble#MapTextObject('vato\e/id\r:noh\rf\"lvi\"'    , 'iID'       , 'i~i' , 1)



call wobble#MapLocalLeader('vato<esc>f>i<space>'                         , 'appAttrList' , '~al')
call wobble#MapLocalLeader('vato<esc>/[ \>]<cr>:noh<cr>i class=""<esc>i' , 'insClass'    , '~ic')
call wobble#MapLocalLeader('vato<esc>/class<cr>:noh<cr>2f"i<space>'      , 'appClass'    , '~ac')
call wobble#MapLocalLeader('vato<esc>/[ \>]<cr>:noh<cr>i id=""<esc>i'    , 'insID'       , '~ii')
