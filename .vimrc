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
Plugin 'vim-scripts/taglist.vim'
Plugin 'vim-scripts/minibufexpl.vim'
Plugin 'scrooloose/nerdtree.git'
Plugin 'mhinz/vim-startify'
Plugin 'ingmarlehmann/vim-franca-highlight'
Plugin 'scrooloose/nerdcommenter.git'
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


set viminfo='20,\"100,:30,%,n~/.viminfo

au BufNewFile,BufRead *.service set filetype=systemd
au BufNewFile,BufRead *.xtend set filetype=java
au BufWinLeave *.* mkview!
au BufWinEnter *.* silent loadview

nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-l> :wincmd l<CR>
" Jump to minibuf
nmap <silent> <c-b> :exe 1 . "wincmd w"<CR>
" Jump to NERDTree
nmap <silent> <c-n> :exe 2 . "wincmd w"<CR>
" Jump to window #i
let i = 1
while i <= 9
    execute 'nnoremap <Leader>' . i . ' :' . i . 'wincmd w<CR>'
    execute 'nnoremap <Leader>b' . i . ' :' . i . 'b<CR>'
    execute 'nnoremap <Leader>s' . i . ' :sb ' . i . '<CR>'
    execute 'nnoremap <Leader>v' . i . ' :vert sb ' . i . '<CR>'
    execute 'nnoremap <Leader>d' . i . ' :bdelete ' . i . '<CR>'
    let i = i + 1
endwhile

nmap <silent> <leader>gt :NERDTreeToggle<CR>
nmap <silent> <leader>O :qa!<CR>
nnoremap <silent> <leader>ss :set scrollbind<CR>
nnoremap <silent> <leader>sn :set noscrollbind<CR>

let g:airline_theme='solarized'
function! WindowNumber()
    let str=tabpagewinnr(tabpagenr())
    return str
endfunction
let g:airline_section_b='%t [:%{WindowNumber()}] -- %{airline#util#wrap(airline#extensions#branch#get_head(),0)}'
let g:airline_section_c='%<%f[:%{WindowNumber()}]%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#'

set colorcolumn=100
