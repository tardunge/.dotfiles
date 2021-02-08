" Vimrc using https://jdhao.github.io/2018/12/24/centos_nvim_install_use_guide_en/
" REF: https://www.youtube.com/watch?v=qgG5Jhi_Els
" TODO: Plugins Required
" 	1. Auto Formatting  # installed Black
" 	2. Project wide Search
"   3. Matchit.vim for python
"   4. Ctags
"   5. Learn Marks

" TODO: Get lightline style file names on tabline
"	and full file name in the status-line

" Git branch on status line helper
function! StatusLineGitBranch()
    return fugitive#head() == "" ? "" : ' '.fugitive#head()
endfunction

" Vim Buffet Custom Colors compatible with PaperColor - Author: Manoj
function! g:BuffetSetCustomColors()
    hi! BuffetCurrentBuffer cterm=bold ctermbg=73 ctermfg=0 guibg=#808080 guifg=#808080
    hi! BuffetActiveBuffer cterm=None ctermbg=8 ctermfg=73 guibg=#808080 guifg=#808080
    hi! BuffetBuffer cterm=None ctermbg=8 ctermfg=245 guibg=#808080 guifg=#808080
    hi! BuffetTab cterm=None ctermbg=251 ctermfg=0 guibg=#808080 guifg=#808080
    hi! BuffetTrunc cterm=NONE ctermbg=73 ctermfg=8 guibg=#808080 guifg=#000000
endfunction

" vim-plug calls
call plug#begin('~/.local/share/nvim/plugged')

" run :PlugInstall command to install plugins for the first time.
Plug 'ryanoasis/vim-devicons'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'nvie/vim-flake8'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'itchyny/lightline.vim'
Plug 'flazz/vim-colorschemes'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'sjl/gundo.vim'
Plug 'bagrat/vim-buffet'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'mhinz/vim-startify'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'samoshkin/vim-find-files'
" Plug 'vim-python/python-syntax'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'psf/black'
Plug 'editorconfig/editorconfig-vim'
Plug '/usr/local/bin/fzf'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'stefandtw/quickfix-reflector.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'SirVer/ultisnips'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'ianding1/leetcode.vim'
call plug#end()

filetype off
filetype plugin indent on
" set rtp+=/usr/local/bin/fzf
" colorscheme
" load colorscheme before semshi
colorscheme PaperColor

" automatically wrap the lines in a quickfix window
" augroup quickfix
"     autocmd!
"     autocmd FileType qf setlocal wrap
" augroup END

" term mode bindings
tnoremap <C-W>n <C-\><C-n>
" doesn't resize the windows if the quickfix or any pane is closed.
set noequalalways

" advanced search resource #visualstar.vim https://vim.fandom.com/wiki/Search_for_visually_selected_text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" leetcode settings
let g:leetcode_browser = 'chrome'
let g:leetcode_solution_filetype = 'python3'
let g:leetcode_hide_paid_only = '1'
nnoremap <leader>ll :LeetCodeList<cr>
nnoremap <leader>lt :LeetCodeTest<cr>
nnoremap <leader>ls :LeetCodeSubmit<cr>
nnoremap <leader>li :LeetCodeSignIn<cr>

" Ripgrep command Smartcase
let g:rg_command = 'rg --vimgrep -S'
let g:rg_highlight = 'true'
let g:rg_derive_root = 'true'
"Find files using plugin
let g:find_files_findprg = 'find $d ! -type d $*'
" high delay time for error highlight semshi
let g:semshi#error_sign_delay=5
autocmd FileType yaml,yml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType go setlocal ts=4 sts=4 sw=4 expandtab
" Leader key declaration
let g:mapleader = ","
" Python Syntax highlighting
" let g:python_highlight_all = 1
" NeoVim python  settings
let g:python_host_prog="/Users/manojbabu/.pyenv/versions/neovim2/bin/python"
let g:python3_host_prog="/Users/manojbabu/.pyenv/versions/neovim3/bin/python"

" Cmdline bindings
:cnoremap <C-A> <Home>
:cnoremap <C-E> <End>
" Do not show stupid q: window
map q: :q

" Vim Buffet mappings
nmap <leader>1 <Plug>BuffetSwitch(1)
nmap <leader>2 <Plug>BuffetSwitch(2)
nmap <leader>3 <Plug>BuffetSwitch(3)
nmap <leader>4 <Plug>BuffetSwitch(4)
nmap <leader>5 <Plug>BuffetSwitch(5)
nmap <leader>6 <Plug>BuffetSwitch(6)
nmap <leader>7 <Plug>BuffetSwitch(7)
nmap <leader>8 <Plug>BuffetSwitch(8)
nmap <leader>9 <Plug>BuffetSwitch(9)
nmap <leader>0 <Plug>BuffetSwitch(10)
let g:buffet_use_devicons = 1
let g:buffet_always_show_tabline = 1
let g:buffet_powerline_separators = 1
let g:buffet_show_index = 1
let g:buffet_tab_icon = ""
let g:buffet_left_trunc_icon = ""
let g:buffet_right_trunc_icon = ""

" Markdown preview mappins
nmap <leader>op <Plug>MarkdownPreview
nmap <leader>sp <Plug>MarkdownPreviewStop
nmap <leader>tp <Plug>MarkdownPreviewToggle

" Vim Buffet Buffer mappings
" noremap <Tab> :bn<CR>
" noremap <S-Tab> :bp<CR>
" noremap <Leader><Tab> :Bw<CR>
" noremap <Leader><S-Tab> :Bonly<CR>
" noremap <C-t> :tabnew split<CR>

" let g:go_debug=['shell-commands']
let g:go_term_enabled = 1
let g:go_diagnostics_enabled = 1
let g:go_term_mode = "split"
let g:go_term_height = 20
let g:go_term_width = 20
let g:go_term_close_on_exit = 0
let g:go_term_reuse = 1
let g:go_doc_popup_window = 1
let g:go_highlight_function_parameters = 1
let g:UltiSnipsExpandTrigger="<tab>"
" Run :Black to auto-format
nnoremap <leader>bl :Black<CR>
" Cursorline highlight \"toggle\" when entering insert mode
" autocmd InsertEnter,InsertLeave * set cul!
set cul " always highlight cursor line

" Disable method preview window of deoplete jedi 
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" Disable auto comment on new line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

let g:go_decls_includes = "func,type"
augroup go
  autocmd!

  autocmd FileType go nmap <silent> <Leader>gop  <Plug>(go-doc-browser)
  autocmd FileType go nmap <silent> <Leader>go  <Plug>(go-doc)
  autocmd FileType go nmap <silent> <Leader>gf  <Plug>(go-referrers)
  autocmd FileType go nmap <silent> <Leader>gd  <Plug>(go-decls)
  autocmd FileType go nmap <silent> <Leader>gl  <Plug>(go-metalinter)
  autocmd FileType go nmap <silent> <Leader>gt  <Plug>(go-diagnostics)
  autocmd FileType go nmap <silent> <Leader>gr  <Plug>(go-run)
  autocmd FileType go nmap <silent> <leader>i  <Plug>(go-info)
  autocmd FileType go nmap <silent> <leader>gi  <Plug>(go-imports)
  autocmd FileType go nmap <silent> <leader>t  <Plug>(go-test)
  autocmd FileType go nmap <silent> <leader>tf  <Plug>(go-test-func)
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
augroup END

" set nofixeol for filetype dot
autocmd FileType dot,lua setlocal nofixeol

" NerdTree auto open when vim vim opened with no files.
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" NerdTree auto open when vim opens a folder
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" command! LS call fzf#run(fzf#wrap({'source': 'ls | tree -L 2  | head -200'}))
" command! LS call fzf#run(fzf#wrap({'source': 'ls', 'dir': <q-args>}, {'options': ['--layout=reverse', '--info=inline', '--preview', 'cat {}']}))
" command! -bang -complete=dir -nargs=* LS
"     \ call fzf#run(fzf#wrap({'source': 'ls', 'dir': <q-args>}, <bang>0))

" FZF Buffer Wipeouts
function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! Wipeouts call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
\ }))

" Fzf Bindings
nnoremap <leader>, :Files<cr>
inoremap <leader>, <esc>:Files<cr>
vnoremap <leader>, <esc>:Files<cr>

nnoremap <leader>h :History<cr>
nnoremap <leader>c :History:<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>w :Wipeouts<cr>

" Fugitive Bindings
" nnoremap <leader>gs :Gstatus<cr>

" Nerd Tree setings
nnoremap <leader>m :NERDTreeToggle<cr>
inoremap <leader>m <esc>:NERDTreeToggle<cr><C-W><C-L>i
vnoremap <leader>m <esc>:NERDTreeToggle<cr>v
let g:NERDTreeIgnore = ['__pycache__', '.venv', '.mypy_cache', '.git[[dir]]', '.pytest_cache']
let NERDTreeShowHidden=1

" set default splits below
set splitbelow
set splitright
" lightline shows the mode 
" set noshowmode
set relativenumber
set nu

" Toggle zoom buffer
let s:win_zoom = 0
function! ToggleWindowZoom()
    if s:win_zoom
        let s:win_zoom = 0
        :exe "normal \<C-W>="
    else
        let s:win_zoom = 1
        :exe "normal \<C-W>_\<C-W>|"
    endif
endfunction


" Pane Navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-Q> <C-W>q
nnoremap <leader>z :call ToggleWindowZoom()<CR>

" To use TAB for auto-completion using deoplete
" inoremap <expr><tab> pumvisible() ? '\<c-n>' : '\<tab>'

" Clear last search highlight
nnoremap <esc> :noh<return><esc>

" NERD Commenter settings
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

" Deoplete for auto completion.
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('ignore_case', v:true)

" function! LightlineFilename()
" Lightline settings
let g:lightline = {
      \ 'colorscheme': 'PaperColor',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'StatusLineGitBranch'
      \ },
      \ }
let g:lightline.separator = { 'left': '', 'right': '' }
let g:lightline.subseparator = {'left': '', 'right': '' }
let g:lightline.enable = {'tabline' : 0 }
" Airline settings
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'
" let g:airline_powerline_fonts = 1
" let g:airline_theme='base16_grayscale'

" Edit and Source Vimrc,tmux,zshrc on the fly
:let tmux_conf = $HOME.'/.tmux.conf'
:let zshrc = $HOME.'/.zshrc'
:nnoremap <leader>et :execute 'vsplit'.tmux_conf<cr>
:nnoremap <leader>ez :execute 'vsplit'.zshrc<cr>
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
:nnoremap <leader>sv :source $MYVIMRC<cr>

" Gundo Settings
nnoremap <leader>u :GundoToggle<CR>

" AutoPairs Settings
" Add <> to the pairs
" let g:AutoPairs = {'```': '```', '`': '`', '"': '"', '{': '}', '''': '''', '(': ')', '''''''': '''''''', '[': ']', '"""': '"""', '<': '>'}

"disable arrow keys
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" General settings
set tabstop=4
set shiftwidth=4
set expandtab

" Git-gutter Settings
" nmap <expr> ]d &diff ? ']czz' : '<Plug>(GitGutterNextHunkzz)'
" nmap <expr> [d &diff ? '[czz' : '<Plug>(GitGutterPrevHunkzz)'

" diff two files on the screen
" :windo diffthis
" :windo diffoff

" scroll syncronously on files/buffers
" :set scrollbind or :set scb
" do this on all files which you need to scroll
" :set scb! to toggle.
