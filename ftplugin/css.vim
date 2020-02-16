if exists("b:did_wobble_css")
  finish
endif
let b:did_wobble_css = 1



if g:wobble_add_keywords
  setlocal iskeyword+=-
  setlocal iskeyword+=.
  setlocal iskeyword+=%
  setlocal iskeyword+=@
endif



" Builds text object mappings for a given sequence. By default, the plugin
" provides both <Plug>Wobble... mappings, and i/a mappings, but optionally
" will omit these so that they may be user-defined.
function! s:MapTextObject(sequence, plug, map)
  " Assign <Plug>Wobble... mappings for visual and operator-pending
  let plugstring =
        \ 'noremap <silent><buffer> <Plug>WobbleCSS_'
        \ . a:plug
        \ . ' :<c-u>normal! '
        \ . a:sequence
        \ . '<cr>'
  execute 'o' . plugstring
  execute 'v' . plugstring

  " Only assign i/a mappings if option not set
  if g:wobble_map_textobjects
    " Assign i/a mappings for visual and operator-pending
    let mapstring =
          \ 'map <silent><buffer> '
          \ . a:map
          \ . ' <Plug>WobbleCSS_'
          \ . a:plug
    execute 'o' . mapstring
    execute 'v' . mapstring
  endif
endfunction

function! s:UnitTextObject()
  normal! viwo

  while getline('.')[col('.') - 1] =~# '\v[0-9\-\.]'
    normal! l
  endwhile

  normal! o
endfunction



call s:MapTextObject('vas',       'aBlock',    'acb')
call s:MapTextObject('][vib',     'iBlock',    'icb')
call s:MapTextObject('(][%ge',    'iSelector', 'ics')
call s:MapTextObject('^vf:',      'aProperty', 'acp')
call s:MapTextObject('^vf:ge',    'iProperty', 'icp')
call s:MapTextObject('^f:lv$',    'aValue',    'acv')
call s:MapTextObject('^f:wvf;ge', 'iValue',    'icv')



onoremap <Plug>WobbleCSS_iUnit :<c-u>call <SID>UnitTextObject()<cr>
xnoremap <Plug>WobbleCSS_iUnit :<c-u>call <SID>UnitTextObject()<cr>

omap icu <Plug>WobbleCSS_iUnit
xmap icu <Plug>WobbleCSS_iUnit
