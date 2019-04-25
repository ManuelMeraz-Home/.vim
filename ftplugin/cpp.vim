" Set this to 0 to disable ale
let g:ale_enabled = 1

" Use all available linters with ale lint 
let b:ale_linters = 'all'

" Tell ale lint where the build directories are to find the json databases
" used by clangtidy and clangcheck.
let g:ale_c_build_dir_names = []

" clang and gcc in ale lint do not use the json databses, so must tell
" them specific flags
let g:ale_cpp_clang_options = "
      \ -std=c++17 
      \ -Wall -Wextra -Wshadow -Wnon-virtual-dtor -Wpedantic"
      \ .$PROJECT_INCLUDE_DIRS

let g:ale_cpp_gcc_options  = ale_cpp_clang_options

let g:ale_cpp_clangtidy_options = $PROJECT_INCLUDE_DIRS

" Let clang tidy find the config file by setting checks to empty
let g:ale_cpp_clangtidy_checks = []

" ale fixers format and clean up C++ code
let g:ale_fixers = {
      \         'cpp': [
      \             'clang-format',
      \             'uncrustify',
      \             'remove_trailing_lines',
      \             'trim_whitespace',
      \            ],}

