color elflord
execute pathogen#infect()
call pathogen#helptags()
filetype plugin indent on
syntax on
set number tabstop=2 ts=2 sw=2 sts=2 nocompatible

" set runtime path (environment variable) for vim
set rtp+=~/.vim/bundle/.fzf
nmap <C-p> :FZF<CR>

set clipboard=unnamed

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

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

" ignore ex mode
map q: <Nop>
nnoremap Q <nop>

" auto complete in insert mode using ctrl+n
autocmd Filetype html set omnifunc=htmlcomplete#CompleteTags
autocmd Filetype javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd Filetype css set omnifunc=csscomplete#CompleteCSS

autocmd Filetype python nnoremap <buffer> <c-k> :exec '!python' shellescape(@%, 1)<cr>

" Matchit - highlights pairs
let g:hl_matchit_enable_on_vim_startup = 1

" Lightline status bar on the bottom 
set laststatus=2

if !has('gui_running')
    set t_Co=256
endif

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

" NERDTree mapping
map <C-n> :NERDTree<CR>

" jshint2
set runtimepath+=~/.vim/bundle/jshint2.vim/

" jshint validation
 nnoremap <silent><F1> :JSHint<CR>
 inoremap <silent><F1> <C-O>:JSHint<CR>
 vnoremap <silent><F1> :JSHint<CR>

" show next jshint error
 nnoremap <silent><F2> :lnext<CR>
 inoremap <silent><F2> <C-O>:lnext<CR>
 vnoremap <silent><F2> :lnext<CR>

" show previous jshint error
 nnoremap <silent><F3> :lprevious<CR>
 inoremap <silent><F3> <C-O>:lprevious<CR>
 vnoremap <silent><F3> :lprevious<CR>

 " move to next buffer
 map gn :bn<cr>

 " move to previous buffer
 map gp :bp<cr>

 " delete current buffer
 map gd :bd<cr>  

 " Beautify
 autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
 " for json
 autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
 " for jsx
 autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
 " for html
 autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
 " for css or scss
 autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

" Use all availabole linters with ale lint 
autocmd Filetype cpp let b:ale_linters = 'all'
autocmd Filetype python let b:ale_linters = [ 'flake8', 'prospector', 'pycodestyle', 'pyflakes', 'pyls', 'pyre']
autocmd Filetype python let g:ale_virtualenv_dir_names = [$VIRTUAL_ENV]
" Tell ale lint where the build directories are to find the json databases
" used by clangtidy and clangcheck.
let g:ale_c_build_dir_names = []

" clang and gcc in ale lint do not use the json databses, so must tell
" them specific flags
let g:ale_cpp_clang_options = "
      \ -std=c++14 
      \ -Wall -Wextra -Wshadow -Wnon-virtual-dtor -Wpedantic"
let g:ale_cpp_gcc_options  = "
      \ -std=c++14 
      \ -Wall -Wextra -Wshadow -Wnon-virtual-dtor -Wpedantic"
" ale fixers format and clean up C++ code
let g:ale_fixers = {
\         'cpp': [
\             'clang-format',
\             'uncrustify',
\             'remove_trailing_lines',
\             'trim_whitespace',
\            ],
\         'python': [
\							'add_blank_lines_for_python_control_statements',
\							'autopep8',
\							'black',
\							'isort',
\							'remove_trailing_lines',
\							'trim_whitespace',
\							'yapf',
\            ],
\          }

" call ale fixers with ctrl+l
nmap <C-l> <Plug>(ale_fix)

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
