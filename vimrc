" Don't use X11 clipboard for vim
set clipboard=exclude:.*

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
set number ts=4 sw=4 sts=4 nocompatible expandtab rnu

" Lightline status bar on the bottom 
set laststatus=2

" Paste mode allows pasting without
" auto indenting in insert mode. This
" toggle that by pressing F2
set pastetoggle=<F2>

" set runtime path (environment variable) for vim
set rtp+=~/.vim/bundle/.fzf
nmap <C-p> :FZF<CR>

" remap WQ to wq
:command WQ wq
:command Wq wq
:command W w
:command Q q

" ignore ex mode
nnoremap q: <Nop>
nnoremap Q <nop>

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

"====PLUGIN SETTINGS====
" Notify when gutentags is generating tags
set statusline+=%{gutentags#statusline()}

" " make YCM compatible with UltiSnips (using supertab)
set encoding=utf-8

" Matchit - highlights pairs
let g:hl_matchit_enable_on_vim_startup = 1

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
