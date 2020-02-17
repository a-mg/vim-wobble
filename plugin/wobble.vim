" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" vim-wobble
" Text objects and tweaks for editing HTML/XML and CSS in Vim
"
" Author:  A. Mattson Gallagher <amg@a-m-g.org>
" Version: 1.0.0
" License: MIT
"
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


" g:wobble_map_textobjects
" (default: on)
"
" Enables default mapping of text objects. If set, the plugin sets up mappings
" in visual and operator-pending modes. If unset, no mappings are created,
" preventing shadowing and leaving them user-configurable. (Text objects are
" always exposed via <Plug>Wobble...)
if !exists("g:wobble_map_textobjects")
  let g:wobble_map_textobjects = 1
endif

" g:wobble_map_localleader
" (default: on)
"
" Enables default mapping of localleader commands for working with HTML/XML
" attributes. If set, the plugin sets up mappings in normal mode. If unset, no
" mappings are created, preventing shadowing and leaving them
" user-configurable.
if !exists("g:wobble_map_localleader")
  let g:wobble_map_localleader = 1
endif

" g:wobble_add_keywords
" (default: on)
"
" Enables tweaks to `iskeyword` settings to improve handling of built-in text
" objects, like numbers in CSS.
if !exists("g:wobble_add_keywords")
  let g:wobble_add_keywords = 1
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
