call plug#begin('~/.vim/autoload/')
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    """ SIDE BARS
    Plug 'scrooloose/nerdtree'
    " Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'ryanoasis/vim-devicons'
    Plug 'preservim/tagbar'
    " Plug 'airblade/vim-gitgutter'

    """ LANGAUGE
    Plug 'stevearc/vim-arduino'
    Plug 'JuliaEditorSupport/julia-vim'


    """ UTILITY
    Plug 'tmsvg/pear-tree'
    Plug 'tpope/vim-commentary'
    Plug 'brooth/far.vim'
    Plug 'junegunn/fzf'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'chipsenkbeil/distant.nvim'
    " Plug 'terryma/vim-multiple-cursors'
    " Plug 'kien/ctrlp.vim'
    " Plug 'mileszs/ack.vim'

    """ FORMAT
    Plug 'prettier/vim-prettier', {'do': 'npm install'}
    Plug 'pseewald/vim-anyfold'
    Plug 'junegunn/vim-easy-align'

    """ GUI
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " Plug 'morhetz/gruvbox'
    " Plug 'drewtempelmeyer/palenight.vim'
    " Plug 'anoike/vim-moneyforward'
    " Plug 'sonph/onehalf'
    " Plug 'rakr/vim-one'
    Plug 'tomasiser/vim-code-dark'
call plug#end()

let exclude=["gruvbox", "ctrlp.vim", "ack.vim", "vim-prettier", "vim-gitgutter", "nerdtree-git-plugin"]
for CONFIG in split(glob('/home/tom1484/.config/nvim/config/plugin/*.vim'), '\n')
    let plug_name=split(CONFIG, "/")[-1][:-5]
    if index(exclude, plug_name) < 0
        exec "source" CONFIG
    endif
endfor
