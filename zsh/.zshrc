export ZSH="/home/bit/.oh-my-zsh"
ZSH_THEME=powerlevel10k/powerlevel10k
# Uncomment the following line to display red dots whilst waiting for completion.
 COMPLETION_WAITING_DOTS="true"
plugins=(
  vscode
  git
  pip
  history
  node
  npm
  docker
  sudo
  tmux
  tmuxinator
  taskwarrior
  zsh-autosuggestions
  zsh-syntax-highlighting
  kubectl
)
ZSH_TMUX_AUTOSTART='true'
source $ZSH/oh-my-zsh.sh
# tab completion
#autoload -U compinit
#compinit
# source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_DISABLE_COMPFIX='true'
# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='mvim'
 fi
# Kubenetes Kubectl auto-completion
if [ $commands[kubectl] ]; then
  source <(kubectl completion zsh)
fi
# display characters correctly over ssh
export LC_CTYPE=en_US.UTF-8
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
# powerline location
source ~/powerlevel10k/powerlevel10k.zsh-theme
#source /home/bit/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#autoload -U +X bashcompinit && bashcompinit
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" #loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" 
export DOCKER_HOST=tcp://localhost:2375
