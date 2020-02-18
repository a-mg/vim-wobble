function! s:PrefixMapping(map)
  return substitute(a:map, '\~', g:wobble_xml_prefix, '')
endfunction

function! wobble#MapTextObject(sequence, name, map, exe)
  let plugstring =
        \  'noremap <silent><buffer> '
        \. '<Plug>Wobble_' . a:name
        \. ' :<c-u>' . (a:exe ? 'execute "' : '') . 'normal! '
        \. a:sequence
        \. (a:exe ? '"' : '') . '<cr>'

  execute 'o' . plugstring
  execute 'x' . plugstring

  if g:wobble_map_textobjects
    let mapstring =
          \  'map <silent><buffer> '
          \. s:PrefixMapping(a:map)
          \. ' <Plug>Wobble_' . a:name

    execute 'o' . mapstring
    execute 'x' . mapstring
  endif
endfunction

function! wobble#MapLocalLeader(sequence, name, map)
  let plugstring =
        \  'noremap <silent><buffer> '
        \. '<Plug>Wobble_' . a:name . ' '
        \. a:sequence

  execute 'n' . plugstring

  if g:wobble_map_localleader
    let mapstring =
          \  'map <silent><buffer> '
          \. '<localleader>' . s:PrefixMapping(a:map)
          \. ' <Plug>Wobble_' . a:name

    execute 'n' . mapstring
  endif
endfunction
