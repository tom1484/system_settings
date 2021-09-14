if !exists('GO_LOADED')

	let g:GO_LOADED = 1

	" Run file
	function! RunFile()
		let file_name = expand('%:t')
		let flags = input('Flags: ')
		let arguments = input('Arguments: ')
		execute ":!go run" flags file_name arguments
	endfunction

	nnoremap <leader>r :call RunFile()<CR>

	" Format file
	function! FormatFile()
		let file_name = expand('%:t')
		let flags = input('Flags: ')
		execute ":!goimports -d -w" flags file_name
	endfunction

	nnoremap <leader>f :call FormatFile()<CR>

	" Test package
	function! TestPackage()
		let flags = input('Flags: ')
		execute ":!go test" flags
	endfunction

	nnoremap <leader>t :call TestPackage()<CR>

	" Install package
	function! InstallPackage()
		let flags = input('Flags: ')
		execute ":!go install" flags
	endfunction

	nnoremap <leader>i :call InstallPackage()<CR>

	" Auto format on save
	" autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')

endif

