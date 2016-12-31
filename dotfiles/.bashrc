# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

#Lets pull in other files

# Load ~/.bash_aliases to get all my aliases.
# This will cleanup .bashrc a bit.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/bash-completion ]; then
  . ~/bash-completion
fi

if [ -f ~/.bash/.global_exports.bash ]; then
    . ~/.bash/.global_exports.bash
fi

if [ -f ~/.bash/.local_exports.bash ]; then
    . ~/.bash/.local_exports.bash
fi

if [ -f ~/.bash/.global_aliases.bash ]; then
    . ~/.bash/.global_aliases.bash
fi

if [ -f ~/.bash/.local_aliases.bash ]; then
    . ~/.bash/.local_aliases.bash
fi

if [ -f ~/.bash/.local_miscellaneous.bash ]; then
    . ~/.bash/.local_miscellaneous.bash
fi

#Adding get functions.
if [ -f ~/.bash/.bash_functions.bash ]; then
    . ~/.bash/.bash_functions.bash
fi

if [ -f ~/.bash/.local_aliases.bash ]; then
    . ~/.bash/.local_aliases.bash
fi

if [ "$color_prompt" = yes ]; then
   PS1="$(getCustomBashPromptWithInformation)"
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

