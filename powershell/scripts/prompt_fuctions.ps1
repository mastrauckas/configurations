.  ($PSScriptRoot + "/git_functions.ps1")
.  ($PSScriptRoot + "/kube_functions.ps1")
.  ($PSScriptRoot + "/virtual_environments.ps1")

$WHITE=[ConsoleColor]::White
$Green=[ConsoleColor]::Green
$DarkGreen=[ConsoleColor]::DarkGreen
$Cyan=[ConsoleColor]::Cyan
$Red=[ConsoleColor]::Red
$Yellow=[ConsoleColor]::Yellow
$DarkCyan=[ConsoleColor]::DarkCyan

function GetCustomPromptWithUnicode {
	if(IsAdmin -eq 1) {
		Write-Host  -NoNewline -ForegroundColor $Red "[A]"
	}

	Write-Host "PS:" -NoNewline -ForegroundColor $DarkGreen
	Write-Host  -NoNewline -ForegroundColor $Cyan $PWD

    if(isKubectlInstalled -ne 0)
    {
        	Write-Host  -NoNewline -ForegroundColor $Green " kube:("

        $currentContext = getCurrentContext
        Write-Host  -NoNewline -ForegroundColor $DarkCyan $currentContext

        Write-Host  -NoNewline -ForegroundColor $Green ":"

        $namespace = getNamespace
        Write-Host  -NoNewline -ForegroundColor $Red $namespace

        	Write-Host  -NoNewline -ForegroundColor $Green ")"
    }

	$branchName=GetCurrentGitBranch
	if($branchName.Length -ne 0)
	{
		Write-Host  -NoNewline -ForegroundColor $Green " git:("
		$sha=GetCurrentGitBranchSha
		if($branchName -eq $sha) {
			Write-Host  -NoNewline -ForegroundColor $DarkCyan "DETACHED HEAD"
		}
		else
		{
			Write-Host  -NoNewline -ForegroundColor $DarkCyan $branchName
		}

		Write-Host  -NoNewline -ForegroundColor $Green ":"
		if($sha.Length -ne 0) {
			Write-Host  -NoNewline -ForegroundColor $Red $sha
		}
		else {
			Write-Host  -NoNewline -ForegroundColor $Red "--none--"
		}

		Write-Host  -NoNewline -ForegroundColor $Green ")"

		if(IsDirty -eq 1) {
			Write-Host  -NoNewline -ForegroundColor $Yellow " λ"
		}
	}

	Write-Host  -NoNewline -ForegroundColor $WHITE " $"
	' '
}

function IsAdmin {
	$Global:CurrentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent()
    $CurrentUser.Groups | ForEach-Object {
        if($_.value -eq "S-1-5-32-544") {
			return 1
        }
    }

    return 0
}
