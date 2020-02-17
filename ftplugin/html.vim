" Only load once for each buffer
if exists("b:did_wobble_html")
  finish
endif
let b:did_wobble_html = 1



" Add keywords to improve handling of word text object (`iw` etc.)
if g:wobble_add_keywords
  " Keep multi-word attributes together (`data-name`)
  setlocal iskeyword+=-
  " Keep decimal numbers together (`1.5`)
  setlocal iskeyword+=.
endif



" s:PrefixMapping()
" Replaces the prefix placeholder (~) with the user-configurable XML mapping
" prefix character (set in xml_prefix).
"
" map : key mapping containing placeholder
function! s:PrefixMapping(map)
  return substitute(a:map, '\~', g:wobble_xml_prefix, '')
endfunction



" s:MapTextObject()
" Constructs text object mappings for a given sequence.
"
" sequence : selection motions
" plug     : internal object name for <Plug> handle
" map      : x/o key mapping (enabled by map_textobjects option)
" exe      : switch to wrap complicated mappings in `execute` statement
function! s:MapTextObject(sequence, plug, map, exe)
  " Build <Plug>WobbleHTML_ mapping
  let plugstring = 'noremap <silent><buffer> <Plug>WobbleHTML_' . a:plug . ' :<c-u>'
        \ . (a:exe ? 'execute "' : '') . 'normal! ' . a:sequence . (a:exe ? '"' : '') . '<cr>'
  " Assign mapping for operator-pending and visual modes
  execute 'o' . plugstring
  execute 'x' . plugstring

  " Only assign key mappings when map_textobjects option is set
  if g:wobble_map_textobjects
    " Build key mapping
    let mapstring = 'map <silent><buffer> ' . s:PrefixMapping(a:map) . ' <Plug>WobbleHTML_' . a:plug
    " Assign mapping for operator-pending and visual modes
    execute 'o' . mapstring
    execute 'x' . mapstring
  endif
endfunction

"       ... attr-sit="amet" ...
" a~a      ^^^^^^^^^^^^^^^^
" i~n       ^^^^^^^^
" i~v                 ^^^^
call s:MapTextObject('f"F=F v2f"'                   , 'aAttrOne'  , 'a~a' , 0)
call s:MapTextObject('f"F=T vt='                    , 'iName'     , 'i~n' , 0)
call s:MapTextObject('f"F=f"lvi"'                   , 'iValue'    , 'i~v' , 0)

"       ... <div class="lorem ipsum" id="dolor" attr-sit="amet">
" a~l           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
" i~l            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
call s:MapTextObject('vato\ef vt>'                  , 'aAttrList' , 'a~l' , 1)
call s:MapTextObject('vato\ef lvt>'                 , 'iAttrList' , 'i~l' , 1)

"       ... class="lorem ipsum" ...
" a~c      ^^^^^^^^^^^^^^^^^^^^
" i~c              ^^^^^^^^^^^
call s:MapTextObject('vato\e/class\r:noh\rF v2f\"'  , 'aClass'    , 'a~c' , 1)
call s:MapTextObject('vato\e/class\r:noh\rf\"lvi\"' , 'iClass'    , 'i~c' , 1)

"       ... id="dolor" ...
" a~i      ^^^^^^^^^^^
" i~i           ^^^^^
call s:MapTextObject('vato\e/id\r:noh\rF v2f\"'     , 'aID'       , 'a~i' , 1)
call s:MapTextObject('vato\e/id\r:noh\rf\"lvi\"'    , 'iID'       , 'i~i' , 1)



" s:MapLocalLeader()
" Constructs localleader-prefixed commands for working with attributes.
"
" sequence : text editing motions/commands
" plug     : internal object name for <Plug> handle
" map      : n key mapping (enabled by map_textobjects option)
function! s:MapLocalLeader(sequence, plug, map)
  " Build <Plug>WobbleHTML_ mapping
  let plugstring = 'noremap <silent><buffer> <Plug>WobbleHTML_' . a:plug . ' ' . a:sequence
  " Assign mapping for normal mode
  execute 'n' . plugstring

  " Only assign key mappings when map_textobjects option is set
  if g:wobble_map_localleader
    " Build key mapping
    let mapstring = 'map <silent><buffer> <localleader>' . s:PrefixMapping(a:map) . ' <Plug>WobbleHTML_' . a:plug
    " Assign mapping for normal mode
    execute 'n' . mapstring
  endif
endfunction

"       ... <div class="lorem ipsum" id="dolor" attr-sit="amet">
" ~al > ... <div class="lorem ipsum" id="dolor" attr-sit="amet" |>
call s:MapLocalLeader('vato<esc>f>i<space>'                         , 'appAttrList' , '~al')

"       ... <div attr-sit="amet">
" ~ic > ... <div class="|" attr-sit="amet">
" ~ac > ... <div class="lorem |" attr-sit="amet">
call s:MapLocalLeader('vato<esc>/[ \>]<cr>:noh<cr>i class=""<esc>i' , 'insClass'    , '~ic')
call s:MapLocalLeader('vato<esc>/class<cr>:noh<cr>2f"i<space>'      , 'appClass'    , '~ac')

"       ... <div attr-sit="amet">
" ~ii > ... <div id="|" attr-sit="amet">
call s:MapLocalLeader('vato<esc>/[ \>]<cr>:noh<cr>i id=""<esc>i'    , 'insID'       , '~ii')
