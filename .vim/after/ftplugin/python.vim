setlocal foldmethod=indent

setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
set expandtab
set autoindent

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"let python_highlight_all=1
let g:ycm_python_binary_path = '/usr/bin/python3'

"let g:syntastic_python_python_exec = '/usr/bin/python3'
"let g:syntastic_python_checkers = ['pylint']
