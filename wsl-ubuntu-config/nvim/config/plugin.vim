call plug#begin('~/.vim/autoload/')
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    """ SIDE BARS
    " Plug 'scrooloose/nerdtree'
    " Plug 'Xuyuanp/nerdtree-git-plugin'
    " Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'ryanoasis/vim-devicons'
    Plug 'preservim/tagbar'
    Plug 'airblade/vim-gitgutter'

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

    """ FORMAT
    Plug 'prettier/vim-prettier', {'do': 'npm install'}
    Plug 'pseewald/vim-anyfold'
    Plug 'junegunn/vim-easy-align'

    """ GUI
    Plug 'itchyny/lightline.vim'
    Plug 'tomasiser/vim-code-dark'
    " Plug 'vim-airline/vim-airline'
    " Plug 'vim-airline/vim-airline-themes'
call plug#end()

" let exclude=["vim-prettier", "vim-gitgutter", "nerdtree-git-plugin"]
let exclude=["nerdtree", "vim-airline", "vim-multiple-cursors"]
for CONFIG in split(glob('/home/tom1484/.config/nvim/config/plugin/*.vim'), '\n')
    let plug_name=split(CONFIG, "/")[-1][:-5]
    if index(exclude, plug_name) < 0
        exec "source" CONFIG
    endif
endfor
