" Load setting for different filetype

	autocmd filetype c source ~/.vim/filetype/c.vim
	autocmd filetype cpp source ~/.vim/filetype/cpp.vim
	autocmd filetype python source ~/.vim/filetype/python.vim

" File

	syntax on
	filetype plugin indent on 
	set foldlevel=1

" General

	set autoread
	set nocompatible
	set nobackup
	set noswapfile
	set history=1024
	set autochdir
	set whichwrap=b,s,<,>,[,]
	set nobomb
	set clipboard=unnamed
	set mouse=a

	set formatoptions-=cro

	silent !stty -ixon

	set ttimeoutlen=0

" }}}

" Lang & Encoding

	let &t_TI=""
	let &t_TE=""

" GUI

	set background=dark
	set cursorline
	highlight cursorline ctermfg=NONE ctermbg=237 cterm=bold guifg=NONE guibg=NONE gui=bold
	hi Folded term=NONE cterm=NONE

	set number relativenumber
	augroup numbertoggle
		autocmd!
		autocmd FocusGained,InsertLeave * set relativenumber
		autocmd FocusLost,InsertEnter * set norelativenumber
	augroup END

	set list lcs=tab:\|\-

" Format

	set autoindent
	set smartindent
	set tabstop=4
	set noexpandtab
	set shiftwidth=4
	set softtabstop=4

" Keymap
	
	" disable default mapping for arrow keys
	nnoremap l <NOP>
	vnoremap l <NOP>
	nnoremap . <NOP>
	vnoremap . <NOP>
	nnoremap , <NOP>
	vnoremap , <NOP>
	nnoremap / <NOP>
	vnoremap / <NOP>

	" use shift+arrow
	noremap <C-LEFT> <S-LEFT>
	noremap <C-LEFT> <S-LEFT>
	noremap <C-RIGHT> <S-RIGHT>
	noremap <C-RIGHT> <S-RIGHT>

	" page down/up
	nnoremap <C-UP> 10k
	inoremap <C-UP> <C-\><C-O>10k
	nnoremap <C-DOWN> 10j
	inoremap <C-DOWN> <C-\><C-O>10j

	" saving
	nnoremap <C-S> :w<CR>
	inoremap <C-S> <Esc>:w<CR>

	" change pane
	inoremap <C-W> <Esc><C-W>

	" replace
	nnoremap <C-R> :Far 
	inoremap <C-R> <Esc>:Far 
	vnoremap <C-R> :Far 

	" find
	nnoremap <C-F> :F 
	inoremap <C-F> <Esc>:F 
	vnoremap <C-F> :F 

	" undo/redo
	nnoremap <C-Z> u
	inoremap <C-Z> <Esc>u
	nnoremap <C-Y> <C-R>
	inoremap <C-Y> <Esc><C-R>

	" copy/cut/paste/delete
	nnoremap <C-C> yy
	inoremap <C-C> <Esc>yya
	vnoremap <C-C> y

	nnoremap <C-X> dd
	inoremap <C-X> <Esc>dda
	vnoremap <C-X> d

	nnoremap <C-V> p
	inoremap <C-V> <Esc>pa
	vnoremap <expr><C-V> 'pgv"'.v:register.'y`>'

	nnoremap <C-D> "_dd
	inoremap <C-D> <Esc>"_dda
	vnoremap <C-D> "_d

	" tab manipulation
	nnoremap <C-Q> :q<CR>
	inoremap <C-Q> <Esc>:q<CR>

	nnoremap <C-N> :tabn<CR>
	inoremap <C-N> <Esc>:tabn<CR>

	nnoremap <C-P> :tabp<CR>
	inoremap <C-P> <Esc>:tabp<CR>

	" auto comment
	nnoremap <C-_> :Commentary<CR>
	inoremap <C-_> <Esc>:Commentary<CR>
	vnoremap <C-_> :Commentary<CR>

	" use bash command
	nnoremap <C-T> :!
	inoremap <C-T> <Esc>:!

	" toggle plugs
	nnoremap <F1> :NERDTreeToggle<CR>
	inoremap <F1> <Esc>:NERDTreeToggle<CR>a

	nnoremap <F2> :TagbarToggle<CR>
	inoremap <F2> <Esc>:TagbarToggle<CR>a

	" easy align
	nnoremap <C-E> :EasyAlign 
	inoremap <C-E> <Esc>:EasyAlign 
	vnoremap <C-E> :EasyAlign 

" Enalbe plugins

	call plug#begin('~/.vim/autoload/')
		" Plug 'fatih/vim-go', {'for': 'go'}
		" Plug 'nsf/gocode', {'for': 'go'}

		Plug 'neoclide/coc.nvim', {'branch': 'release'}
		Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
		Plug 'Xuyuanp/nerdtree-git-plugin', {'on': 'NERDTreeToggle'}
		Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'}

		Plug 'kien/ctrlp.vim'
		Plug 'jiangmiao/auto-pairs'
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
	set ignorecase smartcase

	let g:far#enable_undo=1
	let g:far#highlight_match=1

	let g:far#window_layout='bottom'
	let g:far#window_height=20
	let g:far#preview_window_layout='bottom'
	let g:far#preview_window_height=8

	let g:far#auto_preview=1
	let g:far#auto_preview_on_start=1

	let g:far#collapse_result=0

" Gitgutterr

	let g:gitgutter_override_sign_column_highlight=0
	highlight clear SignColumn

" Airline

	let g:airline_theme='base16_gruvbox_dark_hard'
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



