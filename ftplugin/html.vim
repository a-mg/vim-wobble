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
  if !exists("g:wobble_no_mappings") || !g:wobble_no_mappings
    let mapstring =
          \ 'map <silent><buffer> '
          \ . a:map
          \ . ' <Plug>WobbleHTML_'
          \ . a:plug
    execute 'o' . mapstring
    execute 'v' . mapstring
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





" TODO rewrite following section

" Add/append a class attribute to a tag
nnoremap <buffer> <leader>hic vato<esc>/[ \>]<cr>:noh<cr>i class=""<esc>i
nnoremap <buffer> <leader>hac vato<esc>/class<cr>:noh<cr>2f"i<space>

" Add an id attribute to a tag
nnoremap <buffer> <leader>hii vato<esc>/[ \>]<cr>:noh<cr>i id=""<esc>i

" Append to a tag's attribute list
nnoremap <buffer> <leader>hal vato<esc>f>i<space>
