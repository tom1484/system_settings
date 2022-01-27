let g:coc_global_extensions=[
\ "coc-lists",
\ 'coc-snippets',
\ "coc-prettier"
\ ]

inoremap <silent><expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

let g:coc_snippet_next='<C-N>'
let g:coc_snippet_previous='<C-P>'

""" coc-go
" autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')

""" coc-prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile
