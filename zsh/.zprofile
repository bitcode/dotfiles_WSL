#------- Aliases ---------
alias win='cd /mnt/c/Users/mylam'
alias rc='rustc'
alias dc='cd ..'
alias tsource='tmux source-file ~/.tmux.conf'
alias c='clear'
alias grg='go run main.go'
alias lz='ls -alZ | more'
#------- Aliases for collection of  

# recon
hgrip(){
history | grep $1
}

#----- AWS -------


s3ls(){
aws s3 ls s3://$1
}

s3cp(){
aws s3 cp $2 s3://$1 
}

#----- misc -----

# 
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

#------ Tools ------
dirsearch(){
cd /tools/dirsearch*
python3 dirsearch.py -e . -u $1
}

sqlmap(){
cd /tools/sqlmap*
python sqlmap.py -u $1 
}

knock(){
cd /home/tools/knock/knockpy
python knockpy.py -w list.txt $1
}

ncx(){
nc -l -n -vv -p $1 -k
}

#------SiteMap Script -----
sitemap(){
lynx -dump "http://hackerone.com" | sed -n '/^References$/,$p' | grep -E '[[:digit:]]+\.' | awk '{print $2}' | cut -d\? -f1 | sort | uniq
}

LS_COLORS=$LS_COLORS:'di=0;35:' ; export LS_COLORS

export PATH="$HOME/.cargo/bin:$PATH"
export RUST_SRC_PATH=/usr/local/src/rust/src
