let g:javascript_spec_source_dir       = "/app/assets/javascripts/"
let g:javascript_spec_spec_dir         = "/spec/javascripts/"
let g:javascript_spec_source_file_ext  = ".coffee"
let g:javascript_spec_spec_ext         = "_spec.js.coffee"

function! JSSpecWriteSpecTemplate()
  let s:old_yank = @@
  execute "silent! normal! gg yy<cr>"
  if len(@@) < 5
    call append(0, "\#= require support/spec_helper")
    call append(1, "describe \"\", ->")
    execute "silent! normal! 2Gf\"l"
  endif
  echom @@
  let @@ = s:old_yank
endfunction

function! JsSpecNavigate()
  let s:path = expand('%:p')

  if strridx(s:path, g:javascript_spec_spec_dir) > 1
    let s:file = substitute(s:path, g:javascript_spec_spec_dir, g:javascript_spec_source_dir, "")
    let s:file = substitute(s:file, g:javascript_spec_spec_ext, g:javascript_spec_source_file_ext, "")
    execute "silent! rightbelow vsplit " . s:file
  else
    let s:file = substitute(s:path, g:javascript_spec_source_dir, g:javascript_spec_spec_dir, "")
    let s:file = substitute(s:file, g:javascript_spec_source_file_ext, g:javascript_spec_spec_ext, "")
    execute "silent! rightbelow vsplit " . s:file
    call JSSpecWriteSpecTemplate()
  endif
endfunction
