" Builds text object mappings for a given sequence. By default, the plugin
" provides both <Plug>WobbleHTML_ mappings, and i/a mappings, but optionally
" will omit these so that they may be user-defined.
"
" If a:exe is set, wrap the sequence with `execute` to allow special
" character escape sequences.
function! s:MapTextObject(sequence, plug, map, exe)
  " Assign <Plug>WobbleHTML_ mappings for visual and operator-pending
  let plugstring =
        \ 'noremap <silent><buffer> <Plug>WobbleHTML_'
        \ . a:plug
        \ . ' :<c-u>'
        \ . (a:exe ? 'execute "' : '')
        \ . 'normal! '
        \ . a:sequence
        \ . (a:exe ? '"' : '')
        \ . '<cr>'
  execute 'o' . plugstring
  execute 'v' . plugstring

  " Only assign i/a mappings if option not set
  if !g:wobble_no_mappings
    let mapstring =
          \ 'map <silent><buffer> '
          \ . a:map
          \ . ' <Plug>WobbleHTML_'
          \ . a:plug
    execute 'o' . mapstring
    execute 'v' . mapstring
  endif
endfunction

function! s:MapLocalLeader(sequence, plug, map)
  let plugstring =
        \ 'noremap <silent><buffer> <Plug>WobbleHTML_'
        \ . a:plug
        \ . ' '
        \ . a:sequence
  execute 'n' . plugstring

  if !g:wobble_no_mappings && !g:wobble_no_leader
    let mapstring =
          \ 'map <silent><buffer> <localleader>'
          \ . a:map
          \ . ' <Plug>WobbleHTML_'
          \ . a:plug
    execute 'n' . mapstring
  endif
endfunction



call s:MapTextObject('f"F=T vt=',                    'iName',     'ihn', 0)
call s:MapTextObject('f"F=f"lvi"',                   'iValue',    'ihv', 0)
call s:MapTextObject('f"F=F v2f"',                   'aAttrOne',  'aha', 0)

call s:MapTextObject('vato\ef lvt>',                 'iAttrList', 'ihl', 1)
call s:MapTextObject('vato\ef vt>',                  'aAttrList', 'ahl', 1)

call s:MapTextObject('vato\e/class\r:noh\rf\"lvi\"', 'iClass',    'ihc', 1)
call s:MapTextObject('vato\e/class\r:noh\rF v2f\"',  'aClass',    'ahc', 1)

call s:MapTextObject('vato\e/id\r:noh\rf\"lvi\"',    'iID',       'ihi', 1)
call s:MapTextObject('vato\e/id\r:noh\rF v2f\"',     'aID',       'ahi', 1)



call s:MapLocalLeader('vato<esc>f>i<space>',                         'appAttrList', 'hal')

call s:MapLocalLeader('vato<esc>/[ \>]<cr>:noh<cr>i class=""<esc>i', 'insClass',    'hic')
call s:MapLocalLeader('vato<esc>/class<cr>:noh<cr>2f"i<space>',      'appClass',    'hac')

call s:MapLocalLeader('vato<esc>/[ \>]<cr>:noh<cr>i id=""<esc>i',    'insID',       'hii')
