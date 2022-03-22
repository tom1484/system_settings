let g:coc_global_extensions=[
\     "coc-lists",
\     "coc-snippets",
\ ]

autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
inoremap <silent><expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent><expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

inoremap <silent><expr><NUL> coc#refresh()

nmap gr <Plug>(coc-rename)
nmap gd <Plug>(coc-definition)

inoremap <C-N> <Nop>
let g:coc_snippet_next='<C-N>'
let g:coc_snippet_previous='<C-P>'

