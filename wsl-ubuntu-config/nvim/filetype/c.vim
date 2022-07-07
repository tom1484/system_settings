if !exists('C_LOADED')

    let g:C_LOADED = 1

    let g:C_COMPILER = "gcc"

    " Compile file
    function! CompileFile()
        let file_name = expand('%:p')
        let file_base_name = file_name[:len(file_name)-len('c')-2]
        let flags = input("Flags: ")
        execute ":!".g:C_COMPILER "-o" file_base_name file_name flags
    endfunction

    nnoremap <leader>bc :call CompileFile()<CR>

    " Run executable
    function! RunExecutable()
        let file_name = expand('%:p')
        let file_base_name = file_name[:len(file_name)-len('c')-2]
        if filereadable(file_base_name)
            let arguments = input("Arguments: ")
            execute ":!".file_base_name arguments
        endif
    endfunction

    nnoremap <leader>br :call RunExecutable()<CR>

    " Compile and run
    function! CompileAndRun()
        let file_name = expand('%:p')
        let file_base_name = file_name[:len(file_name)-len('c')-2]
        let flags = input("Flags: ")
        let arguments = input("Arguments: ")
        execute ":!".g:C_COMPILER "-o" file_base_name file_name flags "&&" file_base_name arguments
    endfunction

    nnoremap <leader>bg :call CompileAndRun()<CR>

    " Set compiler
    function! SetCompiler()
        let g:C_COMPILER = input('Compiler: ')
    endfunction

    nnoremap <leader>bi :call SetCompiler()<CR>

endif
