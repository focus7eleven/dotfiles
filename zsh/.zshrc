[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS="--height 60% --layout=reverse --bind 'ctrl-o:execute(open {+})' --preview '([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'"
export FZF_DEFAULT_COMMAND='fd --type f'
# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

export DISABLE_AUTO_TITLE=true
export EDITOR='nvim'
alias mux="tmuxinator"

alias lg="lazygit"

alias vim="nvim"
alias vi="nvim"
alias oldvim="vim"

alias :q="exit"

alias cdtmp="cd $(mktemp -d -t $(whoami))"

alias as="ayarn install"

function jk {
  tmux split-window -v -p 30
  tmux split-window -h -p 50
}

function kk {
  tmux split-window -h -p 70
}

function go {
  nvim -o `fzf`
}

export LC_ALL=en_US.UTF-8

if [[ ! -a ~/.zsh-async ]]; then
  git clone https://github.com/mafredri/zsh-async.git ~/.zsh-async
fi
source ~/.zsh-async/async.zsh

export NVM_DIR="$HOME/.nvm"
function load_nvm() {
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
}

# Initialize worker
async_start_worker nvm_worker -n
async_register_callback nvm_worker load_nvm
async_job nvm_worker sleep 0.1

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

export ZSH="/Users/longcha/.oh-my-zsh"

ZSH_THEME=""

plugins=(
  git
  vi-mode
)

source $ZSH/oh-my-zsh.sh

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

autoload -U promptinit; promptinit
prompt pure
