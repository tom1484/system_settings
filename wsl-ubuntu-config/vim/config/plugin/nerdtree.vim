let g:nerdtree_tabs_open_on_console_startup=0
let NERDTreeWinPos='left'
let NERDTreeWinSize=28
let NERDTreeChDirMode=1
let NERDTreeQuitOnOpen=1

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

nnoremap <silent><F1> :NERDTreeToggle<CR>
