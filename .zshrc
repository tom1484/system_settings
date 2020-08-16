POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="powerlevel10k/powerlevel10k"
POWERLEVEL9K_MODE='nerdfont-complete'

plugins=(
	# git z zsh-autosuggestions extract web-search zsh-syntax-highlighting zsh-completions tmux
	git zsh-syntax-highlighting tmux virtualenv
)
source $ZSH/oh-my-zsh.sh

# disable <C-S>
stty stop undef
stty start undef

# set language
export LANG="en_US.UTF-8"

# push/pull Documents
alias pd='sh ~/.push_documents'
alias pp='sh ~/.pull_documents'

# easy push
alias update="git add --all; git commit -m 'update'; git push"

# source zsh settings
[ -f ~/.p10k.zsh ] && source ~/.p10k.zsh
[ -f ~/.sudhindra.zsh ] && source ~/.sudhindra.zsh

# enable fzf search
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# application settings
[ -d "$HOME/.local/bin" ] && PATH="$PATH:$HOME/.local/bin"

