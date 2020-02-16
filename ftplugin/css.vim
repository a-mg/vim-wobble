if !exists("g:wobble_css_map")
  let g:wobble_css_map = 1
endif



function! s:MapTextObject(sequence, plug, map)
  let plugstring = 'noremap <silent><buffer> <Plug>Wobble' 
        \          . a:plug . ' :normal! ' . a:sequence . '<cr>'
  execute 'o' . plugstring
  execute 'v' . plugstring

  if g:wobble_css_map == 1
    let mapstring = 'map <silent><buffer> ' . a:map
          \         . ' <Plug>Wobble' . a:plug
    execute 'o' . mapstring
    execute 'v' . mapstring
  endif
endfunction



call s:MapTextObject('(][%ge',    'InnerSelector',  'ics')
call s:MapTextObject('^vf:ge',    'InnerProperty',  'icp')
call s:MapTextObject('^vf:',      'AroundProperty', 'acp')
call s:MapTextObject('^f:wvf;ge', 'InnerValue',     'icv')
call s:MapTextObject('^f:lv$',    'AroundValue',    'acv')
