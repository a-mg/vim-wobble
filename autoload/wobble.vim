function! wobble#MapTextObject(sequence, map, ...)
  " Check option flags and set defaults
  let flags = (a:0 > 0) ? a:1 : ''
  " exe -> wrap rhs in execute "...", allowing searches/special chars
  " (default: off)
  let exe   = (stridx(flags, '+e') >= 0)
  " norm -> prefix rhs with normal! ..., which makes motions work and prevents
  " inserting text (always used, except when calling functions) (default: on)
  let norm  = (stridx(flags, '-n') <  0)

  let plugstring =
        \  'noremap <silent><buffer> '
        \. '<Plug>Wobble_' . a:map
        \. ' :<c-u>'
        \. (exe ? 'silent execute "' : '')
        \. (norm ? 'normal! ' : '')
        \. a:sequence
        \. (exe ? '"' : '')
        \. '<cr>'

  " Operator-pending and visual modes. xmap (not vmap) prevents mapping in
  " select mode (mouse), where keys are expected to replace the selection, not
  " act on it. (see :help Select-mode-mapping)
  execute 'o' . plugstring
  execute 'x' . plugstring

  if g:wobble_map_textobjects
    " Map commands if option is set
    let mapstring =
          \  'map <silent><buffer> '
          \. a:map
          \. ' <Plug>Wobble_' . a:map

    execute 'o' . mapstring
    execute 'x' . mapstring
  endif
endfunction



function! wobble#MapLocalLeader(sequence, map)
  let plugstring =
        \  'noremap <silent><buffer> '
        \. '<Plug>Wobble_\' . a:map . ' '
        \. a:sequence

  execute 'n' . plugstring

  if g:wobble_map_localleader
    " Map commands if option is set
    let mapstring =
          \  'map <silent><buffer> '
          \. '<localleader>' . a:map
          \. ' <Plug>Wobble_\' . a:map

    execute 'n' . mapstring
  endif
endfunction



function! wobble#iU()
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
