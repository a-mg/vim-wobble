" Include the HTML mappings in other XML-family filetypes.
" (thanks, othree -- othree/xml.vim)
let s:path = expand('<sfile>:p:h')
execute 'source ' . s:path . '/html.vim'
