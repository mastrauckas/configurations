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
