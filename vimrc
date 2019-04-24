color elflord

" Load vim plugins from bundle
execute pathogen#infect()
call pathogen#helptags()

" Enable filetype detection
" Load the 'ftplugin/filetype.vim' in 'runtimepath'
" Load the 'indent/filetype.vim' in 'runtimepath', as an exam
filetype plugin indent on

" Turn on color highlighting
syntax on

" Show line number, nice tabs, and relative numbers
set number ts=2 sw=2 sts=2 nocompatible expandtab rnu

" Lightline status bar on the bottom 
set laststatus=2

" set runtime path (environment variable) for vim
set rtp+=~/.vim/bundle/.fzf
nmap <C-p> :FZF<CR>

" Automatically copy to clipboard
set clipboard=unnamedplus

" ignore ex mode
map q: <Nop>
nnoremap Q <nop>

" Quit vim with :Q as well
command! Q :q

" move to next buffer
map gn :bn<cr>

" move to previous buffer
map gp :bp<cr>

" delete current buffer
map gd :bd<cr>  

" Turn on colors if using a bare terminal(no gui)
if !has('gui_running')
    set t_Co=256
endif

" fixes backspace
inoremap <silent><backspace> <C-O>:call Backspace()<CR>

function Backspace() 

	let line_length = strwidth(getline('.'))
	"let current_pos = getcurpos()
	"let line_pos = current_pos[1]
	"let col_pos = current_pos[2]
	let line_pos = line('.')
	let col_pos = col('.')

	" not in the beginning nor the end
	if col_pos > 1 && col_pos != line_length
		normal! hx
		startinsert
	" in the end of the line
	elseif col_pos == line_length
		normal! x
		startinsert! 
	" the beginning of the line and not the first line
	elseif col_pos == 1 && line_pos > 1
		if line_length == 0
      normal! kJx
			startinsert!
		else 
      normal! kJ
			startinsert
		endif
	endif

endfunction

"====PLUGIN SETTINGS====
" " make YCM compatible with UltiSnips (using supertab)
set encoding=utf-8
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.','re![_a-zA-z0-9]'],
  \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \             're!\[.*\]\s'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::','re![_a-zA-Z0-9]'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \ }

" " better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Matchit - highlights pairs
let g:hl_matchit_enable_on_vim_startup = 1

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

" NERDTree mapping
map <C-n> :NERDTree<CR>

" call ale fixers with ctrl+l
nmap <C-l> <Plug>(ale_fix)

"FILETYPES
autocmd Filetype python set tabstop=4 ts=4 sw=4 sts=4 

" Run python script with pressing Ctrl-k
autocmd Filetype python nnoremap <buffer> <c-k> :exec '!python' shellescape(@%, 1)<cr>
autocmd Filetype python let b:ale_linters = [ 'flake8', 'prospector', 'pycodestyle', 'pyflakes', 'pyls', 'pyre']
autocmd Filetype python let g:ale_virtualenv_dir_names = [$VIRTUAL_ENV]
autocmd Filetype python let g:ale_fixers = {
      \         'python': [
      \							'add_blank_lines_for_python_control_statements',
      \							'autopep8',
      \							'black',
      \							'isort',
      \							'remove_trailing_lines',
      \							'trim_whitespace',
      \							'yapf',
      \            ],}


" Use all available linters with ale lint 
autocmd Filetype cpp let b:ale_linters = 'all'
" Tell ale lint where the build directories are to find the json databases
" used by clangtidy and clangcheck.
autocmd Filetype cpp let g:ale_c_build_dir_names = []

" clang and gcc in ale lint do not use the json databses, so must tell
" them specific flags
autocmd Filetype cpp let g:ale_cpp_clang_options = "
      \ -std=c++17 
      \ -Wall -Wextra -Wshadow -Wnon-virtual-dtor -Wpedantic"

autocmd Filetype cpp let g:ale_cpp_gcc_options  = ale_cpp_clang_options

" ale fixers format and clean up C++ code
autocmd Filetype cpp let g:ale_fixers = {
      \         'cpp': [
      \             'clang-format',
      \             'uncrustify',
      \             'remove_trailing_lines',
      \             'trim_whitespace',
      \            ],}

