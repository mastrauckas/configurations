RESET='\[\e[0m\]'
WHITE='\[\e[97m\]'
LIGHT_GRAY='\[\e[37m\]'
GREEN='\[\e[32m\]'
BOLD_GREEN='\[\e[1;32m\]'
CYAN='\[\e[36m\]'
LIGHT_CYAN='\[\e[96m\]'
BOLD_RED='\[\e[1;31m\]'
LIGHT_RED='\[\e[91m\]'
LIGHT_PURPLE='\[\e[95m\]'
YELLOW='\[\e[1;33m\]'
BI_CYAN='\[\e[96m\]'
BOLD_BLUE='\[\e[1;34m\]'
ORANGE='\[\e[38;5;214m\]'

function gitBranchDetails {
   local branchName="$(getCurrentGitBranch)"
   if [ ! -z "$branchName" -a "$branchName" != " " ]; then
      echo "("${branchName}")";
      echo -n [`git diff --shortstat`]
   fi
}

function getGitVersion {
   IFS=' ' read -a arry <<< "$(git --version)"
   echo ${arry[2]%.*}
}

function isDirty {
   local SUBMODULE_SYNTAX=''
   local gitVersion=$(getGitVersion)
   #Going to assume it's grater than 1.7.2 which is
   #when --ignore-submodules=dirty was added
   SUBMODULE_SYNTAX="--ignore-submodules=dirty"

   if [[ -n $(git status -s ${SUBMODULE_SYNTAX}  2> /dev/null) ]]; then
      echo "1"
   else
      echo "0"
  fi
}

function getCurrentGitBranch {
   local ref
   ref=$(command git symbolic-ref --quiet HEAD 2> /dev/null)
   local ret=$?
   if [[ $ret != 0 ]]; then
      [[ $ret == 128 ]] && return  # no git repo.
      ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
   fi
   echo ${ref#refs/heads/}
}

function getCurrentGitBranchSha {
   local ref
   ref=$(command git symbolic-ref --quiet HEAD 2> /dev/null)
   local ret=$?
   if [[ $ret != 0 ]]; then
      [[ $ret == 128 ]] && return  # no git repo.
   fi
   echo $(command git rev-parse --short HEAD)
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
   customBashPrompt="${customBashPrompt}${GREEN}\u"
   customBashPrompt="${customBashPrompt}${RESET}"
   #Show @.
   customBashPrompt="${customBashPrompt}${LIGHT_PURPLE}@"
   customBashPrompt="${customBashPrompt}${RESET}"
   #show host with \h.
   customBashPrompt="${customBashPrompt}${LIGHT_GRAY}\h"
   customBashPrompt="${customBashPrompt}${RESET}"
   #Show @.
   customBashPrompt="${customBashPrompt}${LIGHT_PURPLE}@"
   customBashPrompt="${customBashPrompt}${RESET}"
   #Show time.
   #Display current date and time.
   customBashPrompt="${customBashPrompt}${LIGHT_RED}\D{%Y:%m:%d-%l:%M:%S%p}"
   customBashPrompt="${customBashPrompt}${RESET}"
   #Show @
   customBashPrompt="${customBashPrompt}${LIGHT_PURPLE}@"
   customBashPrompt="${customBashPrompt}${RESET}"
   #Show path with \w.
   customBashPrompt="${customBashPrompt}${YELLOW}\w"
   customBashPrompt="${customBashPrompt}${RESET}"
   customBashPrompt="${customBashPrompt}${BI_CYAN}\$(getEndPrompt)"
   customBashPrompt="${customBashPrompt}${RESET}"
   #Cursor color.
   customBashPrompt="${customBashPrompt}${WHITE}$ "
   PS1="${customBashPrompt}"

}

function getCustomBashPromptWithUnicode {
   local customBashPrompt

   customBashPrompt='${debian_chroot:+($debian_chroot)}'
   if [ $? != 0 ]; then
      customBashPrompt="${customBashPrompt}${BOLD_RED}➜ "
   else
      customBashPrompt="${customBashPrompt}${BOLD_GREEN}➜ "
   fi

   customBashPrompt="${customBashPrompt}${RESET}"
   customBashPrompt="${customBashPrompt}${LIGHT_CYAN}\w"
   customBashPrompt="${customBashPrompt}${RESET}"

   local branchName="$(getCurrentGitBranch)"
   if [ ! -z "$branchName" -a "$branchName" != " " ]; then
      customBashPrompt="${customBashPrompt}${BOLD_BLUE} git:("
      customBashPrompt="${customBashPrompt}${RESET}"

      local sha=$(getCurrentGitBranchSha)
      if [ "$branchName" == "$sha" ]; then
         customBashPrompt="${customBashPrompt}${BOLD_RED}DETACHED HEAD"
      else
         customBashPrompt="${customBashPrompt}${BOLD_RED}${branchName}"
      fi

      customBashPrompt="${customBashPrompt}${RESET}"
      customBashPrompt="${customBashPrompt}${BOLD_BLUE}:"
      customBashPrompt="${customBashPrompt}${RESET}"
      customBashPrompt="${customBashPrompt}${ORANGE}${sha}"
      customBashPrompt="${customBashPrompt}${RESET}"
      customBashPrompt="${customBashPrompt}${BOLD_BLUE})"
      customBashPrompt="${customBashPrompt}${RESET}"

      if [ $(isDirty) != 0 ]; then
         customBashPrompt="${customBashPrompt}${YELLOW} ✗"
         customBashPrompt="${customBashPrompt}${RESET}"
      fi
   fi

   customBashPrompt="${customBashPrompt}${WHITE} $ "
   customBashPrompt="${customBashPrompt}${RESET}"

   PS1="$customBashPrompt"
}
