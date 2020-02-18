function! wobble#MapTextObject(sequence, name, map, ...)
  if a:0 > 0
    let exe  = (stridx(a:1, '+e') >= 0)
    let norm = (stridx(a:1, '-n') <  0)
  else
    let exe  = 0
    let norm = 1
  endif

  let plugstring =
        \  'noremap <silent><buffer> '
        \. '<Plug>Wobble_' . a:name
        \. ' :<c-u>'
        \. (exe ? 'execute "' : '')
        \. (norm ? 'normal! ' : '')
        \. a:sequence
        \. (exe ? '"' : '')
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
