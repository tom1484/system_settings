" Startup {{{
set nofoldenable
set autoread
autocmd BufWritePost ~/.vimrc source ~/.vimrc
set laststatus=2

" General {{{

set nocompatible
set nobackup
set noswapfile
set history=1024
set autochdir
set whichwrap=b,s,<,>,[,]
set nobomb
set backspace=indent,eol,start whichwrap =<,>,[,]
" Vim 的預設暫存器和系統剪貼簿共享
set clipboard =unnamed
" 設定 alt 鍵不對映到選單欄
set winaltkeys=no

" }}}

" Lang & Encoding {{{

set fileencodings=utf-8,gbk2312,gbk,gb18030,cp936
set encoding=utf-8
set langmenu=zh_CN
let $LANG = 'en_US.UTF-8'
"language messages zh_CN.UTF-8

"}}}

" GUI {{{

colorscheme gruvbox
"set guifont=Monospace:h20
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

set cursorline
highlight cursorline ctermfg=NONE ctermbg=237 cterm=bold guifg=NONE guibg=NONE gui=bold

set hlsearch
set relativenumber

set bg=dark
hi LineNr cterm=bold ctermfg=DarkGrey ctermbg=NONE
hi Pmenu ctermfg=15 ctermbg=0 guifg=#ffffff guibg=#000000

" StatusLine{{{
au InsertEnter * hi statusline guibg=Cyan ctermfg=37 guifg=Black ctermbg=0
au InsertLeave * hi statusline guibg=DarkGrey ctermfg=8 guifg=White ctermbg=15

" default the statusline to green when entering Vim
hi statusline guibg=DarkGrey ctermfg=8 guifg=White ctermbg=15

" Formats the statusline
set statusline=%f                           " file name
set statusline+=\ [%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%y      "filetype
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag

"set statusline+=\ %=                        " align left
set statusline+=\ Line:%l/%L
"set statusline+=[%p%%]            " line X of Y [percent of file]
set statusline+=\ Col:%c                    " current column
"}}}

" Format {{{

set autoindent
set smartindent
set tabstop=4
set noexpandtab
set shiftwidth=4
set softtabstop=4
syntax on

" }}}

" Keymap {{{

imap <C-S> <Esc>:w<CR>
nmap <C-S> <Esc>:w<CR>

imap <C-W> <Esc><C-W>
imap <C-N> <Esc><C-N>

"}}}

" Plugin{{{

call plug#begin('~/.vim/bundle/')
Plug 'fatih/vim-go'
Plug 'nsf/gocode'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'majutsushi/tagbar'
Plug 'godlygeek/tabular'
Plug 'kien/ctrlp.vim'
Plug 'jiangmiao/auto-pairs'
"Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
call plug#end()

" auto active
autocmd vimenter * NERDTree
"autocmd vimenter * Tagbar

" COC.nvim {{{
let g:coc_global_extensions = [
	\ 'coc-snippets',
	\ 'coc-pairs',
	\ 'coc-tsserver',
	\ 'coc-eslint', 
	\ 'coc-prettier', 
	\ 'coc-json', 
\ ]

inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr><cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

let g:coc_snippet_next = '<CR>'

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

"}}}

" LightLine{{{
let g:lightline = {
	\ 'colorscheme': 'wombat',
	\ 'active': {
		\ 'left': [
			\ [ 'mode', 'paste' ],
			\ [ 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ]
		\ ]
	\ },
	\ 'component_function': {
		\ 'cocstatus': 'coc#status',
		\ 'currentfunction': 'CocCurrentFunction'
    \ },
\ }
"}}}

" CtrlP{{{
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
map <leader>f :CtrlPMRU<CR>
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1
"}}}

" YouCompleteMe{{{
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_key_list_stop_completion = ['<C-y>', '<TAB>']
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui = 0
let g:ycm_enable_diagnostic_signs=0
let g:ycm_enable_diagnostic_highlighting=0
let g:go_fmt_command = "goimports"
"}}}

"NERDTree{{{
let NERDTreeWinPos='left'
let NERDTreeWinSize=32
let NERDTreeChDirMode=1
nmap <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"}}}

" NERDTree-git{{{
let g:NERDTreeIndicatorMapCustom = {
	\ "Modified" :"✹",
	\ "Staged" :"✚",
	\ "Untracked" :"✭",
	\ "Renamed" :"➜",
	\ "Unmerged" :"═",
	\ "Deleted" :"✖",
	\ "Dirty" :"✗",
	\ "Clean" :"✔︎",
	\ "Ignored" : '☒',
	\ "Unknown" :"?"
\ }
"}}}

" Tagbar{{{
nmap <F4> :TagbarToggle<CR>
let g:tagbar_width=32
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
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
"}}}

"}}}

" Function {{{
" Remove trailing whitespace when writing a buffer, but not for diff files.
" From: Vigil
" @see http://blog.bs2.to/post/EdwardLee/17961
function! RemoveTrailingWhitespace()
if &ft != "diff"
let b:curcol = col(".")
let b:curline = line(".")
silent! %s/\s\ $//
silent! %s/\(\s*\n\)\ \%$//
call cursor(b:curline, b:curcol)
endif
endfunction
autocmd BufWritePre * call RemoveTrailingWhitespace()
" }}}

