call plug#begin('~/.config/nvim/plugged')
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    """ SIDE BARS
    Plug 'ryanoasis/vim-devicons'
    Plug 'preservim/tagbar'
    Plug 'airblade/vim-gitgutter'
    Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

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
    Plug 'terryma/vim-expand-region'

    """ FORMAT
    Plug 'prettier/vim-prettier', {'do': 'npm install'}
    Plug 'pseewald/vim-anyfold'
    Plug 'junegunn/vim-easy-align'

    """ GUI
    Plug 'itchyny/lightline.vim'
    Plug 'tomasiser/vim-code-dark'
call plug#end()

" let exclude=['vim-prettier', 'vim-gitgutter', 'nerdtree-git-plugin']
let exclude=['vim-multiple-cursors']
for CONFIG in split(glob('/home/tom1484/.config/nvim/config/plugin/*.vim'), '\n')
    let plug_name=split(CONFIG, '/')[-1][:-5]
    if index(exclude, plug_name) < 0
        exec 'source' CONFIG
    endif
endfor
