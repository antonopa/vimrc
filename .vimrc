set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
Plugin 'sickill/vim-monokai.git'
Plugin 'morhetz/gruvbox'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'kergoth/vim-bitbake'
call vundle#end()
filetype plugin indent on

syntax on
set laststatus=2
set number

set tabstop=2
set shiftwidth=2
set expandtab
set smartindent

set cursorline
set cursorcolumn
set nowrap

"Whitespace alerts
set list
set listchars=tab:>-,trail:~

set relativenumber

colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark='hard'

"Set highlight color for trailing whitespaces. Has to be set after colorscheme
hi SpecialKey ctermfg=254 ctermbg=196

let g:airline_theme='solarized'

set viminfo='20,\"100,:30,%,n~/.viminfo

au BufNewFile,BufRead *.service set filetype=systemd
au BufWinLeave *.* mkview!
au BufWinEnter *.* silent loadview

set colorcolumn=100
