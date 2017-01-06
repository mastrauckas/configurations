#http://stackoverflow.com/questions/43321/worth-switching-to-zsh-for-casual-use
#http://askubuntu.com/questions/825625/how-can-i-extend-the-tab-key-auto-completion-in-the-terminal-to-text-in-the-midd
#http://unix.stackexchange.com/questions/214657/what-does-zstyle-do
#http://arjanvandergaag.nl/blog/customize-zsh-prompt-with-vcs-info.html
#http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#Version-Control-Information
autoload -U colors && colors
autoload -U promptinit && promptinit
autoload -U zutil
autoload -U compinit
compinit
autoload -U complist

if [ -z "$HISTFILE" ]; then
    HISTFILE=$HOME/.zsh_history
fi

#zsh options:
#http://zsh.sourceforge.net/Doc/Release/Options.html

setopt correct_all

## Command history configuration
HISTSIZE=10000
SAVEHIST=10000

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history # share command history data

# Changing/making/removing directory
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

unsetopt menu_complete   # do not autoselect the first completion entry
unsetopt flowcontrol
setopt auto_menu         # show completion menu on successive tab press
setopt complete_in_word
setopt always_to_end



zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*' group-name ”

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

