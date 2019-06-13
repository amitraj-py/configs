filetype plugin indent on



" Vim Easy navigations
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l



set wildmenu
set hlsearch
set ignorecase

set t_Co=256
set colorcolumn=80
set encoding=utf-8

set pastetoggle=<F3>
vnoremap <C-k> "+y

" Map leader to ,
let mapleader=","


" Enable folding
set foldmethod=indent
set foldlevel=99
nnoremap <Space> za




" Saving swap files in seperate directory
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//



" monokai-tasty
let g:vim_monokai_tasty_italic=1
colorscheme vim-monokai-tasty



" Jedi
autocmd FileType python setlocal completeopt-=preview



" Tagbar
nmap <C-m> :TagbarToggle<CR>
let g:tagbar_autoclose=1
let g:tagbar_autofocus=1


" ALE
nmap <C-a> :ALEToggle<CR>



"NERDTree
map <C-n> :NERDTreeToggle<CR>
" Close vim if only NerdTree open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Tabs navigation
nnoremap gj gT
nnoremap gk gt
" Tabs swap
nmap Gj :tabm -1<CR>
nmap Gk :tabm +1<CR>




" NERD Commenter
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1



" lightline
set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'monokai_tasty',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }


" Put these lines at the very end of your vimrc file.

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
