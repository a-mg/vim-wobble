" Text objects for selectors
onoremap <silent> <buffer> ics :normal! [{hhv^<cr>
vnoremap <silent> <buffer> ics :normal! [{hhv^<cr>

" Text objects for properties
onoremap <silent> <buffer> icp :normal! ^vt:ge<cr>
vnoremap <silent> <buffer> icp :normal! ^vt:ge<cr>

" Inner values
onoremap <silent> <buffer> icv :normal! ^f:wvf;ge<cr>
vnoremap <silent> <buffer> icv :normal! ^f:wvf;ge<cr>

" Around values
onoremap <silent> <buffer> acv :normal! ^f:lv$<cr>
vnoremap <silent> <buffer> acv :normal! ^f:lv$<cr>
