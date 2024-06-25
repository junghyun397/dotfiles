" SYSTEM
set nocompatible
set belloff=all
set shell=zsh
set ul=10000

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
set title

" INDENT
filetype plugin indent on
set sw=4
set ai
set si
set et

" VUNDLE
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" NERD-TREE
Plugin 'preservim/nerdtree'
nnoremap <C-n> :NERDTree<CR>
let NERDTreeMinimalUI=1

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

" YCM
Plugin 'Valloric/YouCompleteMe'

" ELDNUV
call vundle#end()
