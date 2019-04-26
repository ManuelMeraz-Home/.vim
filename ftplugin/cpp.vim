" Set this to 0 to disable ale
let g:ale_enabled = 1

" Use all available linters with ale lint 
let b:ale_linters = 'all'

" Tell ale lint where the build directories are to find the json databases
" used by clangtidy and clangcheck.
let g:ale_c_build_dir_names = split(system("ls $PROJECT | grep -i build"), "\n")

" If a build dir exists in the project directory, and it contains a
" compilation database folder, get all the include flags for the file in this
" project. 
let current_file = expand('%:p')
let project_dir = $PROJECT
let get_includes_command = $HOME .'/.vim/.includes_from_build.py ' . project_dir .' '. current_file
let g:current_file_comp_db_includes = system(get_includes_command)

" clang and gcc in ale lint do not use the json databses, so must tell
" them specific flags
let g:ale_cpp_clang_options = "
      \ -std=c++17 
      \ -Wall -Wextra -Wshadow -Wnon-virtual-dtor -Wpedantic "
      \ .$PROJECT_INCLUDE_DIRS." "
      \ .current_file_comp_db_includes

let g:ale_cpp_gcc_options  = ale_cpp_clang_options

let g:ale_cpp_clangtidy_options = $PROJECT_INCLUDE_DIRS ." ".current_file_comp_db_includes

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

