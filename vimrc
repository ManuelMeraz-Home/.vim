" Don't use X11 clipboard for vim
set clipboard=exclude:.*

color elflord

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
