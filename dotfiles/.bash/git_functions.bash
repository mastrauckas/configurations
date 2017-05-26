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
