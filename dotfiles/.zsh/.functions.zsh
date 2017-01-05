BOLD_GREEN="%{$fg_bold[green]%}"
BOLD_BLUE="%{$fg_bold[blue]%}"
BOLD_RED="%{$fg_bold[red]%}"
LIGHT_CYAN=$'%{\e[96m%}'
CYAN="%{$fg[cyan]%}"
BLUE="%{$fg[blue]%}"
YELLOW=$'%{\e[1;33m%}'
WHITE="%{$fg[white]%}"
ORANGE=$'%{\e[38;5;214m%}'
RESET="%{$reset_color%}"

function getGitVersion {
   IFS=' ' read -a arry <<< "$(git --version)"
   echo ${arry[2]%.*}
}

function isDirty {
   local SUBMODULE_SYNTAX=''
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

function getCustomPromptWithUnicode {
   local customPrompt

   #customPrompt='${debian_chroot:+($debian_chroot)}'
   customPrompt="${customPrompt}${BOLD_GREEN}➜ "
   customPrompt="${customPrompt}${RESET}"
   customPrompt="${customPrompt}${LIGHT_CYAN}%~"
   customPrompt="${customPrompt}${RESET}"

   local branchName="$(getCurrentGitBranch)"
   if [ ! -z "$branchName" -a "$branchName" != " " ]; then
      customPrompt="${customPrompt}${BOLD_BLUE} git:("
      customPrompt="${customPrompt}${RESET}"

      local sha=$(getCurrentGitBranchSha)
      if [ "$branchName" = "$sha" ]; then
         customPrompt="${customPrompt}${BOLD_RED}DETACHED HEAD"
      else
         customPrompt="${customPrompt}${BOLD_RED}${branchName}"
      fi

      customPrompt="${customPrompt}${RESET}"
      customPrompt="${customPrompt}${BOLD_BLUE}:"
      customPrompt="${customPrompt}${RESET}"
      customPrompt="${customPrompt}${ORANGE}${sha}"
      customPrompt="${customPrompt}${RESET}"
      customPrompt="${customPrompt}${BOLD_BLUE})"
      customPrompt="${customPrompt}${RESET}"

      if [ $(isDirty) != 0 ]; then
         customPrompt="${customPrompt}${YELLOW} ✗"
         customPrompt="${customPrompt}${RESET}"
      fi
   fi

   customPrompt="${customPrompt}${WHITE} $ "
   customPrompt="${customPrompt}${RESET}"

   PS1="${customPrompt}"
}
