function! wobble#MapTextObject(sequence, name, map, ...)
  let flags = (a:0 > 0) ? a:1 : ''
  let exe   = (stridx(flags, '+e') >= 0)
  let norm  = (stridx(flags, '-n') <  0)

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
  " Select the WORD and move cursor to start of selection
  normal! viWo
  " Walk forward until cursor is on a unit character
  while getline('.')[col('.') - 1] !~# '\v[a-zA-Z%]'
    normal! l
  endwhile
  " Move the cursor to the end of selection
  normal! o
  " Walk back to trim semicolons, commas, etc.
  while getline('.')[col('.') - 1] !~# '\v[a-zA-Z%]'
    normal! h
  endwhile
endfunction
