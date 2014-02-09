This plugin lets you have one mapping to quickly open either the spec file or the source javascript file in a split window.

There are four global variables set that you can override:

    let g:javascript_spec_source_dir       = "/app/assets/javascripts/"
    let g:javascript_spec_spec_dir         = "/spec/javascripts/"
    let g:javascript_spec_source_file_ext  = ".coffee"
    let g:javascript_spec_spec_ext         = "_spec.js.coffee"

To go (or create) a spec file, run

    call JsSpecNavigate()

You'll probably want to add something to your vimrc like

    noremap <leader><s> :call JsSpecNavigate()<CR>
