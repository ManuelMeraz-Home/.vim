set tabstop=4 ts=4 sw=4 sts=4 

" Run python script with pressing Ctrl-k
nnoremap <buffer> <c-k> :exec '!python' shellescape(@%, 1)<cr>
let b:ale_linters = [ 'flake8', 'prospector', 'pycodestyle', 'pyflakes', 'pyls', 'pyre']
let g:ale_virtualenv_dir_names = [$VIRTUAL_ENV]
let g:ale_fixers = {
      \         'python': [
      \							'add_blank_lines_for_python_control_statements',
      \							'autopep8',
      \							'black',
      \							'isort',
      \							'remove_trailing_lines',
      \							'trim_whitespace',
      \							'yapf',
      \            ],}


