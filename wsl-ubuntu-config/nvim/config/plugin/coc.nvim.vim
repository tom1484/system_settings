let g:coc_global_extensions=[
\     "coc-lists",
\     "coc-snippets",
\ ]

autocmd! CompleteDone * if coc#pum#visible()== 0 | pclose | endif
inoremap <silent><expr><TAB> coc#pum#visible() ? coc#pum#next(1) : "\<TAB>"
inoremap <silent><expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<S-TAB>"

inoremap <silent><expr><NUL> coc#refresh()
inoremap <silent><expr><CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>"
" inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" inoremap <silent><expr><CR> coc#pum#visible() ? "\<C-Y>" : "\<CR>"

nmap gr <Plug>(coc-rename)
nmap gd <Plug>(coc-definition)

inoremap <C-N> <Nop>
let g:coc_snippet_next='<C-N>'
let g:coc_snippet_previous='<C-P>'

