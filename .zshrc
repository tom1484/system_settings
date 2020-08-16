export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="powerlevel10k/powerlevel10k"
POWERLEVEL9K_MODE='nerdfont-complete'

# plugins=(
# 	git z zsh-autosuggestions extract web-search zsh-syntax-highlighting zsh-completions tmux
# )
plugins=(
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
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[[ ! -f ~/.sudhindra.zsh ]] || source ~/.sudhindra.zsh

# enable fzf search
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# # Prompts
# POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR='\uE0C0'
# #POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR='\uE0C0'
# POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR='\uE0C2'
# #POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR='\uE0C2'
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir dir_writable vcs virtualenv)
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs command_execution_time ip)
# POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
# POWERLEVEL9K_SHORTEN_DELIMITER=..
# POWERLEVEL9K_PROMPT_ON_NEWLINE=true
# POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=$'\n'
# POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="\uF460%F{073}\uF460%F{109}\uF460%f "
# export ZSH="$HOME/.oh-my-zsh"
# POWERLEVEL9K_MODE='nerdfont-complete'
# ZSH_THEME="powerlevel10k/powerlevel10k"
# export UPDATE_ZSH_DAYS=13
# HIST_STAMPS="yyyy/mm/dd"
# plugins=(
# 	git 
# 	zsh-syntax-highlighting 
# 	tmux 
# 	virtualenv
# )

# source $ZSH/oh-my-zsh.sh
# alias zshconfig="vim ~/.zshrc"
# alias vimconfig="vim ~/.vimrc"
# alias ansibleconfig="vim ~/.ansible/ansible.cfg"
# alias grep='grep --color=auto'