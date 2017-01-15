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

function getCustomPromptWithUnicode {
   local customPrompt

   customPrompt='${debian_chroot:+($debian_chroot)}'
   customPrompt="${customPrompt}${BOLD_RED}$(getVirtualEnvironments)"
   customPrompt="${customPrompt}${RESET}"
   customPrompt="${customPrompt}${BOLD_GREEN}➜ "
   customPrompt="${customPrompt}${RESET}"
   customPrompt="${customPrompt}${LIGHT_CYAN}\w"
   customPrompt="${customPrompt}${RESET}"

   local branchName="$(getCurrentGitBranch)"
   if [ ! -z "$branchName" -a "$branchName" != " " ]; then
      customPrompt="${customPrompt}${BOLD_BLUE} git:("
      customPrompt="${customPrompt}${RESET}"

      local sha=$(getCurrentGitBranchSha)
      if [ "$branchName" == "$sha" ]; then
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

   PS1="$customPrompt"
}
