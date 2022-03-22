call plug#begin('~/.vim/autoload/')
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Plug 'stevearc/vim-arduino'

    Plug 'scrooloose/nerdtree'
    " Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'ryanoasis/vim-devicons'
    " Plug 'airblade/vim-gitgutter'
    " Plug 'prettier/vim-prettier', {'do': 'npm install'}

    " Plug 'kien/ctrlp.vim'
    " Plug 'mileszs/ack.vim'

    " Plug 'terryma/vim-multiple-cursors'
    Plug 'tmsvg/pear-tree'
    Plug 'tpope/vim-commentary'
    Plug 'brooth/far.vim'
    Plug 'pseewald/vim-anyfold'
    Plug 'junegunn/vim-easy-align'
    Plug 'junegunn/fzf'
    Plug 'christoomey/vim-tmux-navigator'

    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'morhetz/gruvbox'
call plug#end()

let exclude=["ctrlp.vim", "ack.vim", "vim-prettier", "vim-gitgutter", "nerdtree-git-plugin"]
for CONFIG in split(glob('/home/tom1484/.vim/config/plugin/*.vim'), '\n')
    let plug_name=split(CONFIG, "/")[-1][:-5]
    if index(exclude, plug_name) < 0
        exec "source" CONFIG
    endif
endfor
