if !get(g:, 'tmux_navigator_no_mappings', 0)
  nnoremap <silent><S-LEFT> :TmuxNavigateLeft<cr>
  nnoremap <silent><S-DOWN> :TmuxNavigateDown<cr>
  nnoremap <silent><S-UP> :TmuxNavigateUp<cr>
  nnoremap <silent><S-RIGHT> :TmuxNavigateRight<cr>
  nnoremap <silent><S-P> :TmuxNavigatePrevious<cr>
endif
