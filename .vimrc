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

nnoremap <C-n> :NERDTree<CR>
let NERDTreeMinimalUI=1

" APPEARANCE
syntax on
set title

" INDENT
filetype plugin indent on
set sw=4
set ai
set si
set et

" KEYMAP
let mapleader = "\<space>"
nnoremap <space> <nop>

noremap <leader>y "+y
nnoremap <leader>p "+p
nnoremap <leader>P "+P

noremap <leader>4 $

noremap gm :call cursor(0, len(getline('.'))/2)<CR>

" VUNDLE
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" NERD-TREE
Plugin 'preservim/nerdtree'

" SURROUND
Plugin 'tpope/vim-surround'

" VIM-FUGITIVE
Plugin 'tpope/vim-fugitive'

" VIM-AIRLINE
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts=1
set noshowmode

" VIM-EXPAND-REGION
Plugin 'terryma/vim-expand-region'
vnoremap <C-W> <Plug>(expand_region_expand)

" YCM
Plugin 'Valloric/YouCompleteMe'

" ELDNUV
call vundle#end()
