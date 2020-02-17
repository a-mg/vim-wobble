" Preamble ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ {{{


" Only load once for each buffer
if exists("b:did_wobble_css")
  finish
endif
let b:did_wobble_css = 1


" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ }}}
" Keyword tweaks ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ {{{


" Add keywords to improve handling of word text object (`iw` etc.)
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


" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ }}}
" Text objects ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ {{{


" s:MapTextObject()
" Constructs text object mappings for a given sequence.
"
" sequence : selection motions
" plug     : internal object name for <Plug> handle
" map      : x/o key mapping (enabled by map_textobjects option)
function! s:MapTextObject(sequence, plug, map)
  " Build <Plug>WobbleCSS_ mapping
  let plugstring =
        \ 'noremap <silent><buffer> <Plug>WobbleCSS_'
        \ . a:plug
        \ . ' :<c-u>normal! '
        \ . a:sequence
        \ . '<cr>'
  " Assign mapping for operator-pending and visual modes
  execute 'o' . plugstring
  execute 'x' . plugstring

  " Only assign key mappings when map_textobjects option is set
  if g:wobble_map_textobjects
    " Build key mapping
    let mapstring =
          \ 'map <silent><buffer> '
          \ . a:map
          \ . ' <Plug>WobbleCSS_'
          \ . a:plug
    " Assign mapping for operator-pending and visual modes
    execute 'o' . mapstring
    execute 'x' . mapstring
  endif
endfunction


"  ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~


" Mnemonic mappings for a complete CSS definition block
" acb   block including selector
" icb   inside block (between { and })
call s:MapTextObject('vas',       'aBlock',    'acb')
call s:MapTextObject('][vib',     'iBlock',    'icb')

"       ...  a, a:hover { ...
" ics        ^^^^^^^^^^
call s:MapTextObject('(][%ge',    'iSelector', 'ics')

"       ... font-weight: bold;
" acp       ^^^^^^^^^^^^
" icp       ^^^^^^^^^^^
" acv                   ^^^^^^
" icv                    ^^^^
call s:MapTextObject('^vf:',      'aProperty', 'acp')
call s:MapTextObject('^vf:ge',    'iProperty', 'icp')
call s:MapTextObject('^f:lv$',    'aValue',    'acv')
call s:MapTextObject('^f:wvf;ge', 'iValue',    'icv')


" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ }}}
" Unit text object ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ {{{


" s:UnitTextObject
" Provides the CSS unit text object.
"
"       ... 100px ...
" icu          ^^
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


"  ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~


" Assign <Plug> mapping for operator-pending and visual modes
onoremap <Plug>WobbleCSS_iUnit :<c-u>call <SID>UnitTextObject()<cr>
xnoremap <Plug>WobbleCSS_iUnit :<c-u>call <SID>UnitTextObject()<cr>

" Only assign key mappings when map_textobjects is set
if g:wobble_map_textobjects
  " Assign mapping for operator-pending and visual modes
  omap icu <Plug>WobbleCSS_iUnit
  xmap icu <Plug>WobbleCSS_iUnit
endif


" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ }}}

" vim: set fdm=marker fdl=0 :
