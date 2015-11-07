call pathogen#infect()
call pathogen#helptags()
:let mapleader =","

"NERD TREE SETTINGS
:nnoremap <leader>m :NERDTreeToggle<cr>
:inoremap <leader>m <esc>:NERDTreeToggle<cr><C-W><C-L>i
:vnoremap <leader>m <esc>:NERDTreeToggle<cr>v

" For Airline to be visible all the time set laststatus to 2.. This disables the default status line. Or else airline will be visible unless you open a split.
set laststatus=2

" Airline Settings for TABS
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" Tab navigation
nnoremap <silent> <C-C> gt<CR>
noremap <silent> <C-X> gT<CR>
inoremap <silent> <C-X> <esc>gT<CR><esc>i
inoremap <silent> <C-C> <esc>gt<CR><esc>i
"----------------------------------------------------------
" Tab Movement
nnoremap <silent> <leader><C-C> :tabm +1<CR>
nnoremap <silent> <leader><C-X> :tabm -1<CR>
inoremap <silent> <leader><C-X> <esc>:tabm -1<CR><esc>i
inoremap <silent> <leader><C-C> <esc>:tabm +1<CR><esc>i

"----------------------------------------------------------
" GENERAL SETTINGS
:set number
:set tabstop=4
:set shiftwidth=4
:set numberwidth=2
:set expandtab
:set smartindent
:nnoremap - ddp
:nnoremap _ ddkkp
:nnoremap <space> kJ
:imap <c-d> <esc>ddi
:let jumpsize = 10
:set textwidth=80
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
:nnoremap <leader>sv :source $MYVIMRC<cr>
:nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
:nnoremap H ^
:nnoremap L $
:inoremap jk <esc>
:colorscheme Tomorrow-Night
" setting foldmethod to indent
:nnoremap <leader>f :set foldmethod=indent<cr>zR
:inoremap <leader>f <esc>:set foldmethod=indent<cr>zRi
:inoremap <leader>f <esc>:set foldmethod=indent<cr>zRv

:set t_Co=256

set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"command W w !sudo tee % >/dev/null
:set noswapfile

execute pathogen#infect()
syntax on
set term=screen-256color
nnoremap <leader>u :GundoToggle<CR>
:set grepprg=ack

"Eclim Confs Never use eclim.. build your own
set nocompatible
filetype plugin indent on
