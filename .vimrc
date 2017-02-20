set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'bling/vim-airline'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'ingmarlehmann/vim-franca-highlight'
Plugin 'kergoth/vim-bitbake'
Plugin 'mhinz/vim-startify'
Plugin 'morhetz/gruvbox'
Plugin 'scrooloose/nerdcommenter.git'
Plugin 'scrooloose/nerdtree.git'
Plugin 'sickill/vim-monokai.git'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-scripts/indentpython.vim'
"Plugin 'vim-scripts/minibufexpl.vim'
Plugin 'vim-scripts/taglist.vim'
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

nnoremap <silent> <leader>tv :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

set colorcolumn=100

" Startify options
let g:startify_session_before_save = [
    \ 'silent! NERDTreeClose'
    \ ]

" CtrlP options

" Magic swapping
function! MarkWindowSwap()
    let g:markedWinNum = winnr()
endfunction

function! DoWindowSwap()
    "Mark destination
    let curNum = winnr()
    let curBuf = bufnr( "%" )
    exe g:markedWinNum . "wincmd w"
    "Switch to source and shuffle dest->source
    let markedBuf = bufnr( "%" )
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' curBuf
    "Switch to dest and shuffle source->dest
    exe curNum . "wincmd w"
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' markedBuf
endfunction

nmap <silent> <leader>mw :call MarkWindowSwap()<CR>
nmap <silent> <leader>pw :call DoWindowSwap()<CR>

let g:ctrlp_cmd = "CtrlPBuffer"
let g:ctrlp_buffer_func = { 'enter': 'CtrlPMappings' }
nnoremap <silent> <leader>cf :CtrlP<cr>
nnoremap <silent> <leader>ct :CtrlPTag<cr>
nnoremap <silent> <leader>cb :CtrlPBuffer<cr>

function! CtrlPMappings()
  nnoremap <buffer> <silent> <C-@> :call <sid>DeleteBuffer()<cr>
endfunction

function! s:DeleteBuffer()
  let path = fnamemodify(getline('.')[2:], ':p')
  let bufn = matchstr(path, '\v\d+\ze\*No Name')
  exec "bd" bufn ==# "" ? path : bufn
  exec "norm \<F5>"
endfunction

nnoremap <leader>ld :lcd %:p:h<CR>
nnoremap <leader>wm :tabedit %<CR>
nnoremap <leader>wr :tabclose<CR>

" enable line numbers
let NERDTreeShowLineNumbers=1
" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber

" show all matches
nnoremap <leader>hs :set hlsearch<CR>
nnoremap <leader>hh :set nohlsearch<CR>

" Close YCM preview window after we exit insert mode
let g:ycm_autoclose_preview_window_after_insertion = 1
