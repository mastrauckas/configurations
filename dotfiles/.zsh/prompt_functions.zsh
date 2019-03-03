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

function getCustomPromptWithUnicode {
   local customPrompt

   #customPrompt='${debian_chroot:+($debian_chroot)}'
   customPrompt="${customPrompt}${BOLD_RED}$(getVirtualEnvironments)"
   customPrompt="${customPrompt}${BOLD_GREEN}➜ "
   customPrompt="${customPrompt}${RESET}"
   customPrompt="${customPrompt}${LIGHT_CYAN}%~"
   customPrompt="${customPrompt}${RESET}"

    if [ $(isKubectlInstalled) != 0 ]; then
      customPrompt="${customPrompt}${BOLD_BLUE} kube:("
      customPrompt="${customPrompt}${RESET}"

      local currentContext="$(getCurrentContext)"
      customPrompt="${customPrompt}${BOLD_RED}${currentContext}"

      customPrompt="${customPrompt}${RESET}"
      customPrompt="${customPrompt}${BOLD_BLUE}:"
      customPrompt="${customPrompt}${RESET}"

       local namespace="$(getNamespace)"
      customPrompt="${customPrompt}${BOLD_RED}${namespace}"

      customPrompt="${customPrompt}${BOLD_BLUE})"
   fi

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
