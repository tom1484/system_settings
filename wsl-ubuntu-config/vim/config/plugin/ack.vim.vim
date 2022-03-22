nnoremap <leader>a :Ack!<SPACE>

if executable('ag')
  let g:ackprg='ag --vimgrep'
endif
