if !exists('C_LOADED')

	let g:C_LOADED = 1

	let g:C_COMPILER = "gcc"

	" Compile file
	function! CompileFile()
		let file_name = expand('%:t')
		let file_base_name = expand('%:r')
		let flags = input("Flags: ")
		execute ":!".g:C_COMPILER "-o" file_base_name file_name flags
	endfunction

	nnoremap <leader>c :call CompileFile()<CR>

	" Run executable
	function! RunExecutable()
		let file_base_name = expand('%:r')
		if filereadable(file_base_name)
			let arguments = input("Arguments: ")
			execute ":!./".file_base_name arguments
		endif
	endfunction

	nnoremap <leader>r :call RunExecutable()<CR>

	" Compile and run
	function! CompileAndRun()
		let file_name = expand('%:t')
		let file_base_name = expand('%:r')
		let flags = input("Flags: ")
		let arguments = input("Arguments: ")
		execute ":!".g:C_COMPILER "-o" file_base_name file_name flags "&& ./".file_base_name arguments
	endfunction

	nnoremap <leader>g :call CompileAndRun()<CR>

	" Set compiler
	function! SetCompiler()
		let g:C_COMPILER = input('Compiler: ')
	endfunction

	nnoremap <leader>i :call SetCompiler()<CR>

endif
