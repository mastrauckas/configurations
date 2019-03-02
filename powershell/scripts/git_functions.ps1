function IsDirty {
    if((git status -s --ignore-submodules=dirty).length -ne 0) {
        return 1
    }

    return 0
}

function GetCurrentGitBranch {
    $ref=git symbolic-ref --quiet HEAD
	if($ref.length -ne 0) {
		return $ref.Substring(11)
    }
    else {
        $ref=git rev-parse --short HEAD
    }
    return $ref
}

function GetCurrentGitBranchSha {
     return git rev-parse --short HEAD
}

function GetRemoteBranch {
   return  git for-each-ref --format='%(upstream:short)' $(git symbolic-ref -q HEAD)
}

