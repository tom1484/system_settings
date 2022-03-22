let g:ctrlp_map=''
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=10
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1
let g:ctrlp_show_hidden=1

let g:ctrlp_prompt_mappings = {
\ 'AcceptSelection("e")': ['<2-LeftMouse>'],
\ 'AcceptSelection("t")': ['<cr>'],
\ }

nnoremap <leader>p :CtrlPMixed<CR>

