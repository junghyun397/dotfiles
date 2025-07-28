" SYSTEM
set belloff=all
set shell=zsh
set ul=10000

set nocompatible
set bs=indent,eol,start

" SEARCH
set ic
set is
set hls

" NAVIGATION
set scrolloff=5
set rnu
set nu

" APPEARANCE
syntax on
set title

" KEYMAP
let mapleader = "\<space>"
nnoremap <space> <nop>

map <leader>y "+y
map <leader>x "+x
map <leader>c "+c
map <leader>p "+p
map <leader>P "+P

map <leader>4 $

" PLUGINS
vnoremap <C-W> <Plug>(expand_region_expand)

