" g:wobble_no_mappings
" (default: off)
"
" If set, the plugin will not create any mappings for text objects or
" commands, leaving them to the user. (Text objects and commands are always
" exposed via <Plug>Wobble...)
if !exists("g:wobble_no_mappings")
  let g:wobble_no_mappings = 0
endif

" g:wobble_no_leader
" (default: off)
"
"
" If set, the plugin will not create any <localleader> mappings. (Used for
" insert/append HTML attributes)
if !exists("g:wobble_no_leader")
  let g:wobble_no_leader = 0
endif

" g:wobble_xml_prefix
" (default: h)
"
" Configures the prefix/namespace for XML-family text objects (ihv -> inner
" value). I write HTML more than XML or XSLT, etc., so `h` is the default.
" Users writing XML frequently might prefer `x`.
if !exists("g:wobble_xml_prefix")
  let g:wobble_xml_prefix = 'h'
endif
