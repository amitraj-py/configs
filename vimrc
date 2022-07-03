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
set colorcolumn=90
set encoding=utf-8
set mouse=a

set pastetoggle=<F3>
vnoremap <C-k> "+y

" Map leader to ,
let mapleader=","

" Enable folding
set foldmethod=indent
set foldlevel=99
nnoremap <Space> za


" FZF
nnoremap <leader>s :FZF<cr>

" line nos.
set nu
set relativenumber

" Saving swap files in seperate directory
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" CSS
autocmd FileType css,scss set omnifunc=csscomplete#CompleteCSS
autocmd FileType css,scss,go
  \ if &omnifunc != '' |
  \   call SuperTabChain(&omnifunc, "<c-p>") |
  \   call SuperTabSetDefaultCompletionType("<c-x><c-u>") |
  \ endif


" JS
" autocmd FileType js set omnifunc=syntaxcomplete#Complete


" java
au BufNewFile,BufRead *.java set tabstop=2 shiftwidth=2 expandtab

" python: PEP 8 indentation
au BufNewFile,BufRead *.py set tabstop=4 shiftwidth=4 expandtab
autocmd FileType python nnoremap <C-i> :!isort %<CR><CR>
autocmd FileType python nnoremap <leader>y :0,$!yapf<Cr><C-o>

" javascript/typescript
au BufNewFile,BufRead *.ts set tabstop=2 shiftwidth=2 expandtab
au BufNewFile,BufRead *.js set tabstop=2 shiftwidth=2 expandtab
au BufNewFile,BufRead *.jsx set tabstop=2 shiftwidth=2 expandtab

" css/scss, html
au BufNewFile,BufRead *.css set tabstop=2 shiftwidth=2 expandtab
au BufNewFile,BufRead *.scss set tabstop=2 shiftwidth=2 expandtab
au BufNewFile,BufRead *.html set tabstop=2 shiftwidth=2 expandtab

au BufNewFile,BufRead *.c set tabstop=8 shiftwidth=8 expandtab


" monokai-tasty
let g:vim_monokai_tasty_italic=1
colorscheme vim-monokai-tasty
" set termguicolors


" Golang; https://github.com/golang/tools/blob/master/gopls/doc/vim.md
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_highlight_functions = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1

let g:go_auto_type_info = 1 " Automatically get signature/type info for object under cursor

autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

" golang autocomplete on inserting dot
au filetype go inoremap <buffer> . .<C-x><C-o>
let g:go_code_completion_icase=1
let g:go_imports_autosave=0


" Jedi
autocmd FileType python setlocal completeopt-=preview


" format using black for a visual selection
xnoremap <Leader>k :!black -q -<CR>


" Tagbar
nmap <C-m> :TagbarToggle<CR>
let g:tagbar_autoclose=1
let g:tagbar_autofocus=1

" ALE
nmap <C-a> :ALEToggle<CR>
let g:ale_completion_enabled=1
nmap <silent> <leader>aj :ALENext<cr>
nmap <silent> <leader>ak :ALEPrevious<cr>
nmap <silent> <leader>f :ALEFix<cr>

let g:ale_linters = {
\   'python': ['flake8', 'mypy'],
\   'rust': ['analyzer'],
\   'javascript': ['eslint'],
\   'go': ['gofmt'] 
\}

let g:ale_fixers = {
\   'python': ['black'],
\   'go': ['gofmt'],
\   'javascript': ['eslint'],
\}

" let g:ale_fix_on_save = 1

" let g:ale_completion_autoimport=1

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
let NERDTreeIgnore = ['__pycache__']




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
set guioptions-=e
let g:lightline = {
      \ 'colorscheme': 'monokai_tasty',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'filename': 'LightlineFilename',
      \ },
      \ }

function! LightlineFilename()
	return expand('%')
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0


nnoremap <leader>l :ls<CR>:b<space>

" rustfmt
" let g:rustfmt_autosave = 1 

" set completeopt=menu,menuone,preview,noselect,noinsert
" set completeopt=menu,menuone,popup,noselect,noinsert
" set completeopt=menu,menuone,popup
set completeopt=menu,noselect,noinsert,popup


" Emmet
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}


set rtp+=~/.fzf

" for e in emoji#list()
"   call append(line('$'), printf('%s (%s)', emoji#for(e), e))
" endfor
" set completefunc=emoji#complete

" Put these lines at the very end of your vimrc file.

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
