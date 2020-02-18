"
" vim-wobble
" Text objects and tweaks for editing HTML/XML and CSS in Vim
"
" Author:  A. Mattson Gallagher <amg@a-m-g.org>
" Version: 1.0.0
" License: MIT
"



if exists("g:loaded_wobble")
  finish
endif
let g:loaded_wobble = 1



function! s:PluginSetting(name, default)
  let setting = "g:wobble_" . a:name
  if !exists(setting)
    execute 'let ' . setting . ' = ' . a:default
  endif
endfunction

call s:PluginSetting('map_textobjects' , 1)
call s:PluginSetting('map_localleader' , 1)
