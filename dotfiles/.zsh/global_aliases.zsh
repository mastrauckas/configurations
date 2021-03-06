alias ll='ls -alFG'
alias la='ls -AG'
alias l='ls -CFG'
alias codei='code-insiders'
alias codeis='code-insiders --disable-gpu'

alias ads='azuredatastudio'

# git alias
alias gtc='git commit'
alias gtcm='git commit -m'
alias gta='git add'
alias gtacm='git commit -am'
alias gts='git status'
alias gtd='git diff'
alias gtds='git diff --staged'
alias gtph='git push'
alias gtpl='git pull'
alias gtco='git checkout'
alias gtca='git config -l | grep alias'
alias gtcount='git shortlog -sn'

# Remove alias that Oh My Zsh creates
unalias gco 2>/dev/null

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
# some more ls aliases
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias muc="history | awk 'BEGIN {FS=\"[ \\t]+|\\\\|\"} {print \$3}' | sort | uniq -c | sort -nr | head"

# source config
alias sc="source ~/.zshrc"

# start a new tmux session
alias tmuxs="tmux new -s"

eval $(thefuck --alias)

# kubectl
alias kns='kubectl config set-context $(kubectl config current-context) --namespace'
