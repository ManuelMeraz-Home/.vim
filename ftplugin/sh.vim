" Set this to 0 to disable ale
let g:ale_enabled = 1

" Use all available linters with ale lint 
let b:ale_linters = 'all'

" ale fixers format and clean up C++ code
let g:ale_fixers = {
      \         'sh': [
      \             'shfmt',
      \             'remove_trailing_lines',
      \             'trim_whitespace',
      \            ],}

