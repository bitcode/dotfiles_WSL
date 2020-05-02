export ZSH="/home/bitcode/.oh-my-zsh"
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
ZSH_DISABLE_COMPFIX='true'
export LC_CTYPE=en_US.UTF-8
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" #loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" 
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="$HOME/.cargo/bin:$PATH"

# -------- Aliases ---------

alias win='cd /mnt/c/Users/mylam'
alias rc='rustc'
alias dc='cd ..'
alias tsource='tmux source-file ~/.tmux.conf'
alias c='clear'
alias grg='go run main.go'
alias launchchrome="\"/mnt/c/Program Files (x86)/Google/Chrome/Application/chrome.exe\""

#----- Recon Bash Scripts -----
 
certspotter(){
curl -s https://certspotter.com/api/v0/certs\?domain\=$1 | jq '.[].dns_names[]' | sed 's/\"//g' | sed 's/\*\.//g' | sort -u | grep $1
} #h/t Michiel Prins

crtsh(){
curl -s https://crt.sh/\?q\=\%.$1\&output\=json | jq -r '.[].name_value' | sed 's/\*\.//g' | sort -u
}

certnmap(){
curl https://certspotter.com/api/v0/certs\?domain\=$1 | jq '.[].dns_names[]' | sed 's/\"//g' | sed 's/\*\.//g' | sort -u | grep $1  | nmap -T5 -Pn -sS -i - -$
} #h/t Jobert Abma

certbrute(){
cat $1.txt | while read line; do python3 dirsearch.py -e . -u "https://$line"; done
}

ipinfo(){
curl http://ipinfo.io/$1
}

#------SiteMap Script -----

sitemap(){
lynx -dump "http://hackerone.com" | sed -n '/^References$/,$p' | grep -E '[[:digit:]]+\.' | awk '{print $2}' | cut -d\? -f1 | sort | uniq
}

