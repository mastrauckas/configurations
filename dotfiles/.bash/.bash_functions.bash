function gitBranchDetails {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return;
    echo "("${ref#refs/heads/}")";
    echo -n [`git diff --shortstat`]
}

function getEndPrompt {
   GIT_BRANCH_DETAILS=$(gitBranchDetails)
   local prompt
   if [ -n "$GIT_BRANCH_DETAILS" ]; then
      #Show git branch.
      prompt=$GIT_BRANCH_DETAILS
   fi

   #Just show prompt.
   echo "$prompt"
}

function getCustomBashPrompt {
   local customBashPrompt
   customBashPrompt='${debian_chroot:+($debian_chroot)}'
   customBashPrompt="$customBashPrompt\[\033[00;32m\]\u"
   #Show @.
   customBashPrompt="$customBashPrompt\[\033[01;35m\]@"
   #show host with \h.
   customBashPrompt="$customBashPrompt\[\033[00;37m\]\h"
   #Show @.
   customBashPrompt="$customBashPrompt\[\033[01;35m\]@"
   #Show time.
   #Display current date and time.
   customBashPrompt="$customBashPrompt\[\033[01;31m\]\D{%Y:%m:%d-%l:%M:%S%p}"
   #Show @
   customBashPrompt="$customBashPrompt\[\033[01;35m\]@"
   #Show path with \w.
   customBashPrompt="$customBashPrompt\[\033[01;33m\]\w"
   customBashPrompt="$customBashPrompt\[\033[01;96m\]\$(getEndPrompt)"
   #Cursor color.
   customBashPrompt="$customBashPrompt\[\033[01;37m\]$ "
   echo "$customBashPrompt"
}
