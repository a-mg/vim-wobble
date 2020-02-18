function! wobble#MapTextObject(sequence, name, map, norm, exe)
  let plugstring =
        \  'noremap <silent><buffer> '
        \. '<Plug>Wobble_' . a:name
        \. ' :<c-u>'
        \. (a:exe ? 'execute "' : '')
        \. (a:norm ? 'normal! ' : '')
        \. a:sequence
        \. (a:exe ? '"' : '')
        \. '<cr>'

  execute 'o' . plugstring
  execute 'x' . plugstring

  if g:wobble_map_textobjects
    let mapstring =
          \  'map <silent><buffer> '
          \. a:map
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
          \. '<localleader>' . a:map
          \. ' <Plug>Wobble_' . a:name

    execute 'n' . mapstring
  endif
endfunction

function! wobble#iUnit()
  " Select the word and move cursor to start of selection
  normal! viwo
  " Walk forward (deselecting) until cursor is not over a number
  while getline('.')[col('.') - 1] =~# '\v[0-9\-\.]'
    normal! l
  endwhile
  " Move the cursor to the end of selection
  normal! o
endfunction
