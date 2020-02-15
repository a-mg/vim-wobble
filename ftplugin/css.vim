" Options ============================================================== {{{

if !exists("g:wobble_css_map")
  let g:wobble_css_map = 1
endif

" ====================================================================== }}}
" Utilities ============================================================ {{{

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

" ====================================================================== }}}
" Text Objects ========================================================= {{{

" Text objects for selectors
onoremap <silent> <buffer> ics :normal! [{hhv^<cr>
vnoremap <silent> <buffer> ics :normal! [{hhv^<cr>

" Inner properties
onoremap <silent> <buffer> icp :normal! ^vt:ge<cr>
vnoremap <silent> <buffer> icp :normal! ^vt:ge<cr>

" Around properties
onoremap <silent> <buffer> acp :normal! ^vt:<cr>
vnoremap <silent> <buffer> acp :normal! ^vt:<cr>

" Inner values
onoremap <silent> <buffer> icv :normal! ^f:wvf;ge<cr>
vnoremap <silent> <buffer> icv :normal! ^f:wvf;ge<cr>

" Around values
onoremap <silent> <buffer> acv :normal! ^f:lv$<cr>
vnoremap <silent> <buffer> acv :normal! ^f:lv$<cr>

" ====================================================================== }}}
