" use jj for escape
noremap <M-Q> <Esc>

" use shift+arrow
noremap <C-LEFT> <S-LEFT>
noremap <C-RIGHT> <S-RIGHT>

" delete previous word
inoremap <C-H> <C-W>

" page down/up
nnoremap <C-UP> 5k
vnoremap <C-UP> 5k
" inoremap <C-UP> <C-\><C-O>10k
nnoremap <C-DOWN> 5j
vnoremap <C-DOWN> 5j
" inoremap <C-DOWN> <C-\><C-O>10j

" saving
nnoremap <C-S> :w<CR>

" undo/redo
nnoremap <C-Z> u
nnoremap <C-Y> <C-R>

" copy/cut/paste/delete
nnoremap <C-C> "0yy
vnoremap <C-C> "0y

nnoremap <C-X> "0dd
vnoremap <C-X> "0d

nnoremap <C-V> "0p
" vnoremap <expr><C-V> 'pgv"'.v:register.'y`>'
vnoremap <C-V> "0p
" inoremap <C-V> <C-R>0

nnoremap <C-D> dd
vnoremap <C-D> d

" remap visual-block
nnoremap <leader>v <C-V>

" add a new line
nnoremap <silent><NL> o<Esc>

" use bash command
" nnoremap <C-T> :!

" unmap <C-B> and <C-W>
nnoremap <C-A> <Nop>
nnoremap <C-W> <Nop>

" tab manipulation
nnoremap <C-A>s :tabs<CR>
nnoremap <C-A>x :q<CR>

nnoremap <C-A>n gt
nnoremap <C-A>p gT

" nnoremap <C-A><UP> <C-W><UP>
" nnoremap <C-A><DOWN> <C-W><DOWN>
" nnoremap <C-A><LEFT> <C-W><LEFT>
" nnoremap <C-A><RIGHT> <C-W><RIGHT>

nnoremap <C-A>c :tabe 
nnoremap <C-A>h :vsplit 
nnoremap <C-A>v :split 

" switch tab by numbers
nnoremap <C-A>1 1gt
nnoremap <C-A>2 2gt
nnoremap <C-A>3 3gt
nnoremap <C-A>4 4gt
nnoremap <C-A>5 5gt
nnoremap <C-A>6 6gt
nnoremap <C-A>7 7gt
nnoremap <C-A>8 8gt
nnoremap <C-A>9 9gt

