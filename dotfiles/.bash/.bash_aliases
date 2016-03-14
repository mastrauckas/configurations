alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

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

alias muc="history | awk 'BEGIN {FS=\"[ \t]+|\\|\"} {print \$3}' | sort | uniq -c | sort -nr | head"


alias sb="source ~/.bashrc"
alias vb="vim ~/.bashrc"
alias vba="vim ~/.bash/.bash_aliases"
alias vbg="vim ~/.bash/.bash_git"

alias vv="vim ~/.vimrc"
alias vvm="vim ~/.vim/configs/mappings.vim"
alias vvs="vim ~/.vim/configs/settings.vim"
alias vvp="vim ~/.vim/configs/plugins.vim"
alias vva="vim ~/.vim/configs/abbrev.vim"
alias vva="vip ~/.vim/configs/private.vim"
