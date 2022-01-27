set regexpengine=1
" set ignorecase smartcase

let g:far#enable_undo=1
let g:far#highlight_match=1

let g:far#window_layout='bottom'
let g:far#window_height=8
let g:far#preview_window_layout='bottom'
let g:far#preview_window_height=4

let g:far#auto_preview=1
let g:far#auto_preview_on_start=0

" replace
nnoremap <C-R> :Far 
vnoremap <C-R> :Far 

" find
nnoremap <C-F> :F 
vnoremap <C-F> :F 
