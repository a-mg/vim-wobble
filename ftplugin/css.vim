" Builds text object mappings for a given sequence. By default, the plugin
" provides both <Plug>Wobble... mappings, and i/a mappings, but optionally
" will omit these so that they may be user-defined.
function! s:MapTextObject(sequence, plug, map)
  " Assign <Plug>Wobble... mappings for visual and operator-pending
  let plugstring = 'noremap <silent><buffer> <Plug>Wobble'
        \ . a:plug . ' :normal! ' . a:sequence . '<cr>'
  execute 'o' . plugstring
  execute 'v' . plugstring

  " Only assign i/a mappings if option not set
  if !exists("g:wobble_no_mappings") || !g:wobble_no_mappings
    " Assign i/a mappings for visual and operator-pending
    let mapstring = 'map <silent><buffer> ' . a:map
          \ . ' <Plug>Wobble' . a:plug
    execute 'o' . mapstring
    execute 'v' . mapstring
  endif
endfunction



call s:MapTextObject('vas',       'AroundBlock',    'acb')
call s:MapTextObject('][vib',     'InnerBlock',     'icb')
call s:MapTextObject('(][%ge',    'InnerSelector',  'ics')
call s:MapTextObject('^vf:ge',    'InnerProperty',  'icp')
call s:MapTextObject('^vf:',      'AroundProperty', 'acp')
call s:MapTextObject('^f:wvf;ge', 'InnerValue',     'icv')
call s:MapTextObject('^f:lv$',    'AroundValue',    'acv')
