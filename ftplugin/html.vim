" Text objects for element attributes
"
"       <div class="lorem ipsum" id="dolor" attr-sit="amet">
"                     ^
" iha:       -----
" ihv:              -----------
" aha:      --------------------
"
vnoremap <silent> <buffer> iha :normal! f"F=T vt=<cr>
onoremap <silent> <buffer> iha :normal! f"F=T vt=<cr>
vnoremap <silent> <buffer> ihv :normal! f"F=f"lvi"<cr>
onoremap <silent> <buffer> ihv :normal! f"F=f"lvi"<cr>
vnoremap <silent> <buffer> aha :normal! f"F=F v2f"<cr>
onoremap <silent> <buffer> aha :normal! f"F=F v2f"<cr>

" Text objects for element attribute list
"
"       <div class="lorem ipsum" id="dolor" attr-sit="amet">
" ihl:       ----------------------------------------------
" ahl:      -----------------------------------------------
"
vnoremap <silent> <buffer> ihl :<c-u>execute "normal! vato\ef lvt>"<cr>
onoremap <silent> <buffer> ihl :<c-u>execute "normal! vato\ef lvt>"<cr>
vnoremap <silent> <buffer> ahl :<c-u>execute "normal! vato\ef vt>"<cr>
onoremap <silent> <buffer> ahl :<c-u>execute "normal! vato\ef vt>"<cr>

" Text objects for element class
"
"       <div class="lorem ipsum" id="dolor" attr-sit="amet">
" ihc:              -----------
" ahc:      --------------------
"
vnoremap <silent> <buffer> ihc :<c-u>execute "normal! vato\e/class\r:noh\rf\"lvi\""<cr>
onoremap <silent> <buffer> ihc :<c-u>execute "normal! vato\e/class\r:noh\rf\"lvi\""<cr>
vnoremap <silent> <buffer> ahc :<c-u>execute "normal! vato\e/class\r:noh\rF v2f\""<cr>
onoremap <silent> <buffer> ahc :<c-u>execute "normal! vato\e/class\r:noh\rF v2f\""<cr>

" Text objects for element id
"
"       <div class="lorem ipsum" id="dolor" attr-sit="amet">
" ihi:                               -----
" ahi:                          -----------
"
vnoremap <silent> <buffer> ihi :<c-u>execute "normal! vato\e/id\r:noh\rf\"lvi\""<cr>
onoremap <silent> <buffer> ihi :<c-u>execute "normal! vato\e/id\r:noh\rf\"lvi\""<cr>
vnoremap <silent> <buffer> ahi :<c-u>execute "normal! vato\e/id\r:noh\rF v2f\""<cr>
onoremap <silent> <buffer> ahi :<c-u>execute "normal! vato\e/id\r:noh\rF v2f\""<cr>



" Add/append a class attribute to a tag
nnoremap <buffer> <leader>hic vato<esc>/[ \>]<cr>:noh<cr>i class=""<esc>i
nnoremap <buffer> <leader>hac vato<esc>/class<cr>:noh<cr>2f"i<space>

" Add an id attribute to a tag
nnoremap <buffer> <leader>hii vato<esc>/[ \>]<cr>:noh<cr>i id=""<esc>i

" Append to a tag's attribute list
nnoremap <buffer> <leader>hal vato<esc>f>i<space>
