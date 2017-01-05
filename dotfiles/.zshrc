autoload -U colors && colors

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

PS1="$(getCustomPromptWithUnicode)"

