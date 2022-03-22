call plug#begin('~/.vim/autoload/')
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
    Plug 'Xuyuanp/nerdtree-git-plugin', {'on': 'NERDTreeToggle'}
    Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'}

    Plug 'kien/ctrlp.vim'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'tmsvg/pear-tree'
    Plug 'tpope/vim-commentary'
    Plug 'brooth/far.vim'
    Plug 'tmhedberg/matchit'
    Plug 'tpope/vim-fugitive'
    Plug 'pseewald/vim-anyfold'
    Plug 'junegunn/vim-easy-align'

    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'morhetz/gruvbox'
call plug#end()

for CONFIG in split(glob('~/.vim/config/plugin/*.vim'), '\n')
    exe "source" CONFIG
endfor
