#http://stackoverflow.com/questions/43321/worth-switching-to-zsh-for-casual-use
#http://askubuntu.com/questions/825625/how-can-i-extend-the-tab-key-auto-completion-in-the-terminal-to-text-in-the-midd
autoload -U colors && colors
autoload -U promptinit && promptinit
autoload -U zutil
autoload -U compinit
compinit
autoload -U complist

zstyle ':completion:*' matcher-list '' \
  'm:{a-z\-}={A-Z\_}' \
  'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
  'r:|?=** m:{a-z\-}={A-Z\_}'
#autoload -Uz bracketed-paste-magic
#zle -N bracketed-paste bracketed-paste-magic
#autoload -Uz url-quote-magic
#zle -N self-insert url-quote-magic


autoload -U compinit

compinit

if [ -f ~/z/z.sh ]; then
   . ~/z/z.sh
fi

if [ -f ~/.zsh/.global_exports.zsh ]; then
    . ~/.zsh/.global_exports.zsh
fi

if [ -f ~/.zsh/.local_exports.zsh ]; then
    . ~/.zsh/.local_exports.zsh
fi

if [ -f ~/.zsh/.global_aliases.zsh ]; then
    . ~/.zsh/.global_aliases.zsh
fi

if [ -f ~/.zsh/.local_aliases.zsh ]; then
    . ~/.zsh/.local_aliases.zsh
fi

if [ -f ~/.zsh/.local_miscellaneous.zsh ]; then
    . ~/.zsh/.local_miscellaneous.zsh
fi

if [ -f ~/.zsh/.functions.zsh ]; then
    . ~/.zsh/.functions.zsh
fi

if [ -f ~/.zsh/.local_aliases.zsh ]; then
    . ~/.zsh/.local_aliases.zsh
fi

PROMPT_COMMAND=getCustomPromptWithUnicode
precmd() { eval "$PROMPT_COMMAND" }

