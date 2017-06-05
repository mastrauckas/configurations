function IsDirty {
    if((git status -s --ignore-submodules=dirty).length -ne 0) {
        return 1
    }

    return 0
}

function GetCurrentGitBranch {
    $ref=git symbolic-ref --quiet HEAD
	if($ref.length -ne 0) {
		$postion = $ref.LastIndexOf("/")
		return $ref.Substring($postion+1)
    }
    else {
        $ref=git rev-parse --short HEAD
    }
    return $ref
}

function GetCurrentGitBranchSha {
     return git rev-parse --short HEAD
}

