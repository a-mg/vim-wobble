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
