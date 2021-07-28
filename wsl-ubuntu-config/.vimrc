" Load setting for different filetype

	autocmd filetype c source ~/.vim/iletype/c.vim
	autocmd filetype cpp source ~/.vim/filetype/cpp.vim
	autocmd filetype python source ~/.vim/filetype/python.vim
	autocmd filetype go source ~/.vim/filetype/go.vim

" File

	syntax on
	filetype plugin indent on 
	set foldlevel=99

" General

	set nocompatible
	set nobackup
	set nobomb
	set noswapfile

	set history=1024
	set autochdir
	set whichwrap=b,s,<,>,[,]
	set clipboard=unnamed
	set mouse=a
	autocmd FileType * setlocal formatoptions-=cro
	set autoread
	autocmd CursorHold * checktime

	silent !stty -ixon

	set ttimeoutlen=0
	augroup FastEscape
		autocmd!
		au InsertEnter * set timeoutlen=0
		au InsertLeave * set timeoutlen=1000
	augroup END

" Lang & Encoding

	let &t_TI=""
	let &t_TE=""

" GUI

	set background=dark
	set cursorline
	highlight cursorline ctermfg=NONE ctermbg=237 cterm=bold guifg=NONE guibg=NONE gui=bold
	hi Folded term=NONE cterm=NONE

	set number norelativenumber

" Format

	set autoindent
	set smartindent
	set tabstop=4
	set noexpandtab
	set shiftwidth=4
	set softtabstop=4
	set list lcs=tab:\|\-
	" set tabstop=8
	" set softtabstop=0
	" set expandtab
	" set shiftwidth=4
	" set smarttab

" Keymap

	" disable default mapping for arrow keys
	nnoremap l <UP>
	vnoremap l <UP>
	nnoremap . <DOWN>
	vnoremap . <DOWN>
	nnoremap , <LEFT>
	vnoremap , <LEFT>
	nnoremap / <RIGHT>
	vnoremap / <RIGHT>

	" use shift+arrow
	noremap <C-LEFT> <S-LEFT>
	noremap <C-RIGHT> <S-RIGHT>

	" page down/up
	nnoremap <C-UP> 10k
	inoremap <C-UP> <C-\><C-O>10k
	vnoremap <C-UP> 10k
	nnoremap <C-DOWN> 10j
	inoremap <C-DOWN> <C-\><C-O>10j
	vnoremap <C-DOWN> 10j

	" saving
	nnoremap <C-S> :w<CR>

	" replace
	nnoremap <C-R> :Far 
	vnoremap <C-R> :Far 

	" find
	nnoremap <C-F> :F 
	vnoremap <C-F> :F 

	" undo/redo
	nnoremap <C-Z> u
	nnoremap <C-Y> <C-R>

	" copy/cut/paste/delete
	nnoremap <C-C> yy
	vnoremap <C-C> y

	nnoremap <C-X> dd
	vnoremap <C-X> d

	nnoremap <C-V> p
	vnoremap <expr><C-V> 'pgv"'.v:register.'y`>'

	nnoremap <C-D> "_dd
	vnoremap <C-D> "_d

	" use bash command
	nnoremap <C-T> :!

	" unmap <C-B> for tab
	nnoremap <C-B> <Nop>

	" tab manipulation
	nnoremap <silent><C-B>l :tabs<CR>
	nnoremap <silent><C-B>q :q<CR>

	nnoremap <C-B>n gt
	nnoremap <C-B>p gT

	nnoremap <C-B>c :tabe 
	nnoremap <C-B>h :vsplit 
	nnoremap <C-B>v :split 

	" switch tab by numbers
	nnoremap <C-B>1 1gt
	nnoremap <C-B>2 2gt
	nnoremap <C-B>3 3gt
	nnoremap <C-B>4 4gt
	nnoremap <C-B>5 5gt
	nnoremap <C-B>6 6gt
	nnoremap <C-B>7 7gt
	nnoremap <C-B>8 8gt
	nnoremap <C-B>9 9gt

	" auto comment
	nnoremap <silent><C-_> :Commentary<CR>
	vnoremap <silent><C-_> :Commentary<CR>

	" toggle plugs
	nnoremap <silent><F1> :NERDTreeToggle<CR>
	nnoremap <silent><F2> :TagbarToggle<CR>

	" easy align
	nnoremap <silent><C-E> :EasyAlign 
	vnoremap <silent><C-E> :EasyAlign 

" Enalbe plugins

	call plug#begin('~/.vim/autoload/')
		Plug 'neoclide/coc.nvim', {'branch': 'release'}
		Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
		Plug 'Xuyuanp/nerdtree-git-plugin', {'on': 'NERDTreeToggle'}
		Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'}

		Plug 'kien/ctrlp.vim'
		" Plug 'jiangmiao/auto-pairs'
		Plug 'tpope/vim-commentary'
		Plug 'brooth/far.vim'
		Plug 'tmhedberg/matchit'
		Plug 'airblade/vim-gitgutter'
		Plug 'tpope/vim-fugitive'
		Plug 'pseewald/vim-anyfold'
		Plug 'junegunn/vim-easy-align'

		Plug 'vim-airline/vim-airline'
		Plug 'vim-airline/vim-airline-themes'
		Plug 'morhetz/gruvbox'
	call plug#end()

" COC.nvim

	let g:coc_global_extensions=[
		\ "coc-lists",
		\ 'coc-snippets',
		\ "coc-prettier"
	\ ]

	inoremap <silent><expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
	inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
	inoremap <expr><CR> pumvisible() ? "\<C-y>" : "\<CR>"

	autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

	let g:coc_snippet_next='<C-N>'
	let g:coc_snippet_previous='<C-P>'

	" coc-go
	" autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')

	" coc-prettier
	command! -nargs=0 Prettier :CocCommand prettier.formatFile

" CtrlP

	let g:ctrlp_map='<leader>p'
	let g:ctrlp_working_path_mode=0
	let g:ctrlp_match_window_bottom=1
	let g:ctrlp_max_height=20
	let g:ctrlp_match_window_reversed=0
	let g:ctrlp_mruf_max=500
	let g:ctrlp_follow_symlinks=1

" Far.vim

	set lazyredraw
	set regexpengine=1
	" set ignorecase smartcase

	let g:far#enable_undo=1
	let g:far#highlight_match=1

	let g:far#window_layout='bottom'
	let g:far#window_height=20
	let g:far#preview_window_layout='bottom'
	let g:far#preview_window_height=8

	let g:far#auto_preview=1
	let g:far#auto_preview_on_start=0

" Gitgutterr

	let g:gitgutter_override_sign_column_highlight=0
	highlight clear SignColumn

" Airline

	let g:airline_theme='base16_gruvbox_dark_hard'
	let g:airline_powerline_fonts=1
	let g:airline#extensions#tabline#enabled=1
	let g:airline_powerline_fonts=1

" Gruvbox

	colorscheme gruvbox

" vim-go

	let g:go_fmt_command="goimports"

" NERDTree

	let g:nerdtree_tabs_open_on_console_startup=0
	let NERDTreeWinPos='left'
	let NERDTreeWinSize=28
	let NERDTreeChDirMode=1
	let NERDTreeQuitOnOpen=1

	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Tagbar

	let g:tagbar_width=28
	let g:tagbar_autoclose=1
	let g:tagbar_autofocus=1

	let g:tagbar_type_go={
		\ 'ctagstype' : 'go',
		\ 'kinds' : [
			\ 'p:package',
			\ 'i:imports:1',
			\ 'c:constants',
			\ 'v:variables',
			\ 't:types',
			\ 'n:interfaces',
			\ 'w:fields',
			\ 'e:embedded',
			\ 'm:methods',
			\ 'r:constructor',
			\ 'f:functions'
		\ ],
		\ 'sro' : '.',
		\ 'kind2scope' : {
			\ 't' : 'ctype',
			\ 'n' : 'ntype'
		\ },
		\ 'scope2kind' : {
			\ 'ctype' : 't',
			\ 'ntype' : 'n'
		\ },
		\ 'ctagsbin'  : 'gotags',
		\ 'ctagsargs' : '-sort -silent'
	\ }

" FoldAny

	autocmd Filetype * AnyFoldActivate
	let g:anyfold_fold_comments=0

" EasyAlign


