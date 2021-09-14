if !exists('PYTHON_LOADED')

	let g:PYTHON_LOADED = 1

	let g:PYTHON_INTERPRETER = "python"

	" Run executable
	function! RunFile()
		let file_name = expand('%:t')
		let flags = input("Flags: ")
		let arguments = input('Arguments: ')
		execute ":!".g:PYTHON_INTERPRETER flags file_name arguments
	endfunction

	nnoremap <leader>r :call RunFile()<CR>

	" Set interpreter
	function! SetInterpreter()
		let g:PYTHON_INTERPRETER = input('Interpreter: ')
	endfunction

	nnoremap <leader>i :call SetInterpreter()<CR>

endif
