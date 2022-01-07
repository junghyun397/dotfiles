" SYSTEM
set nocompatible

" SEARCH
set ic
set is
set hls

" NAVIGATION
set scrolloff=5
set rnu
set nu

" LOCAL
syntax on
set noshowmode

" INDENT
filetype plugin indent on
set ai
set si
set et

" VUNDLE
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" VIM-FUGITIVE
Plugin 'tpope/vim-fugitive'

" VIM-COMMAND-T
Plugin 'git://git.wincent.com/command-t.git'

" VIM-SPARKUP
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" VIM-AIRLINE
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts=1

" VIM-EXPAND-REGION
Plugin 'terryma/vim-expand-region'
vmap <C-W> <Plug>(expand_region_expand)

" ELDNUV
call vundle#end()