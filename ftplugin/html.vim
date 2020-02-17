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



function! s:PrefixMapping(map)
  return substitute(a:map, '\~', g:wobble_xml_prefix, '')
endfunction

function! s:MapTextObject(sequence, plug, map, exe)
  let plugstring = 'noremap <silent><buffer> <Plug>WobbleHTML_' . a:plug . ' :<c-u>'
        \ . (a:exe ? 'execute "' : '') . 'normal! ' . a:sequence . (a:exe ? '"' : '') . '<cr>'
  execute 'o' . plugstring
  execute 'x' . plugstring

  if g:wobble_map_textobjects
    let mapstring = 'map <silent><buffer> ' . s:PrefixMapping(a:map) . ' <Plug>WobbleHTML_' . a:plug
    execute 'o' . mapstring
    execute 'x' . mapstring
  endif
endfunction



call s:MapTextObject('f"F=F v2f"'                   , 'aAttrOne'  , 'a~a' , 0)
call s:MapTextObject('f"F=T vt='                    , 'iName'     , 'i~n' , 0)
call s:MapTextObject('f"F=f"lvi"'                   , 'iValue'    , 'i~v' , 0)

call s:MapTextObject('vato\ef vt>'                  , 'aAttrList' , 'a~l' , 1)
call s:MapTextObject('vato\ef lvt>'                 , 'iAttrList' , 'i~l' , 1)

call s:MapTextObject('vato\e/class\r:noh\rF v2f\"'  , 'aClass'    , 'a~c' , 1)
call s:MapTextObject('vato\e/class\r:noh\rf\"lvi\"' , 'iClass'    , 'i~c' , 1)

call s:MapTextObject('vato\e/id\r:noh\rF v2f\"'     , 'aID'       , 'a~i' , 1)
call s:MapTextObject('vato\e/id\r:noh\rf\"lvi\"'    , 'iID'       , 'i~i' , 1)



function! s:MapLocalLeader(sequence, plug, map)
  let plugstring = 'noremap <silent><buffer> <Plug>WobbleHTML_' . a:plug . ' ' . a:sequence
  execute 'n' . plugstring

  if g:wobble_map_localleader
    let mapstring = 'map <silent><buffer> <localleader>' . s:PrefixMapping(a:map) . ' <Plug>WobbleHTML_' . a:plug
    execute 'n' . mapstring
  endif
endfunction

call s:MapLocalLeader('vato<esc>f>i<space>'                         , 'appAttrList' , '~al')
call s:MapLocalLeader('vato<esc>/[ \>]<cr>:noh<cr>i class=""<esc>i' , 'insClass'    , '~ic')
call s:MapLocalLeader('vato<esc>/class<cr>:noh<cr>2f"i<space>'      , 'appClass'    , '~ac')
call s:MapLocalLeader('vato<esc>/[ \>]<cr>:noh<cr>i id=""<esc>i'    , 'insID'       , '~ii')
