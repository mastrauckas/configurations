RESET='\[\033[0m\]'
WHITE='\[\033[1;37m\]'
BLACK='\[\030[0;30m\]'
DARK_GRAY='\[\033[1;30m\]'
LIGHT_GRAY='\[\033[0;37m\]'
GREEN='\[\033[00;32m\]'
LIGHT_GREEN='\[\033[1;32m\]'
BLUE='\[\033[0;34m\]'
LIGHT_BLUE='\[\033[1;34m\]'
CYAN='\[\033[0;36m\]'
LIGHT_CYAN='\[\033[1;36m\]'
RED='\[\033[0;31m\]'
LIGHT_RED='\[\033[1;31m\]'
PURPLE='\[\033[0;35m\]'
LIGHT_PURPLE='\[\033[1;35m\]'
BROWN='\[\033[0;33m\]'
YELLOW='\[\033[1;33m\]'

# High Intensity
I_BLACK='\[\033[0;90m\]'
I_RED='\[\033[0;91m\]'
I_GREEN='\[\033[0;92m\]'
I_YELLOW='\[\033[0;93m\]'
I_BLUE='\[\033[0;94m\]'
I_PURPLE='\[\033[0;95m\]'
I_CYAN='\[\033[0;96m\]'
I_WHITE='\[\033[0;97m\]'

# Bold High Intensity
BI_BLACK='\[\033[1;90m\]'
BI_RED='\[\033[1;91m\]'
BI_GREEN='\[\033[1;92m\]'
BI_YELLOW='\033[1;93m\]'
BI_BLUE='\[\033[1;94m\]'
BI_PURPLE='\[\033[1;95m\]'
BI_CYAN='\[\033[01;96m\]'
BI_WHITE='\[\033[1;97m\]'

# High Intensity backgrounds
On_I_BLACK='\[\033[0;100m\]'
On_I_RED='\[\033[0;101m\]'
On_I_GREEN='\[\033[0;102m\]'
On_I_YELLOW='\[\033[0;103m\]'
On_I_BLUE='\[\033[0;104m\]'
On_I_PURPLE='\[\033[0;105m\]'
On_I_CYAN='\[\033[0;106m\]'
On_I_WHITE='\[\033[0;107m\]'

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

function getCustomBashPromptWithInformation {
   local customBashPrompt

   customBashPrompt='${debian_chroot:+($debian_chroot)}'
   customBashPrompt="$customBashPrompt$GREEN\u"
   #Show @.
   customBashPrompt="$customBashPrompt$LIGHT_PURPLE@"
   #show host with \h.
   customBashPrompt="$customBashPrompt$LIGHT_GRAY\h"
   #Show @.
   customBashPrompt="$customBashPrompt$LIGHT_PURPLE@"
   #Show time.
   #Display current date and time.
   customBashPrompt="$customBashPrompt$LIGHT_RED\D{%Y:%m:%d-%l:%M:%S%p}"
   #Show @
   customBashPrompt="$customBashPrompt$LIGHT_PURPLE@"
   #Show path with \w.
   customBashPrompt="$customBashPrompt$YELLOW\w"
   customBashPrompt="$customBashPrompt$BI_CYAN$(getEndPrompt)"
   #Cursor color.
   customBashPrompt="$customBashPrompt$WHITE$ "
   echo "$customBashPrompt"
}
