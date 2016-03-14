##Information on getting Posh-Git for Powershell go to:
#http://haacked.com/archive/2011/12/13/better-git-with-powershell.aspx/
#and http://haacked.com/archive/2011/12/19/get-git-for-windows.aspx/
 
$env:path += ";C:\Tools\Vim\vim74"
$env:path += ";C:\Tools\Git\cmd"
$env:path += ";C:\Tools\Git\bin;C:\Tools\Git\usr\bin"
$env:path += ";C:\Tools\MongoDB\Server\3.2\bin"
 
#Setting this for whatever reason is not making msysgit
#so I went in and att the envirnment virable in Windows
#Remove-Variable -Force HOME
#Windows 10 you get an error when trying to set HOME but setting it in Windows 10 instead of here works.
#To look at git profile it's at C:\Git\etc\profile
#Set-Variable HOME "C:\Git\home\<user>"
#Set-Variable ~ $HOME
(Get-PSProvider 'FileSystem').Home = "C:\Tools\Git\home\<user>"
 
Set-Location C:\Projects
$Global:CurrentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent()
$UserType = "User"
$CurrentUser.Groups | foreach { if($_.value -eq "S-1-5-32-544") {$UserType = "Admin"} }
New-Alias Open Invoke-Item
function cdp { Set-Location C:\Projects }
#This add posh-git like a command prompt and stuff. 
#However, I want to set my own command prompt.
# Load posh-git example profile
. 'C:\Users\<user>\Documents\WindowsPowerShell\Modules\posh-git\profile.example.ps1'
#Set-PSReadlineOption -TokenKind Parameter -ForegroundColor Blue
Start-SshAgent -Quiet
 
function prompt {
	if($UserType -eq "Admin") {
		$host.ui.rawui.WindowTitle = "" + $(get-location) + " : Admin"
		#$host.UI.RawUI.ForegroundColor = "Yellow"
	}
	else {
		$host.ui.rawui.WindowTitle = $(get-location)
	}
	
	Write-Host ([Environment]::UserName) -f Green -nonewline;
	Write-Host ("@") -f Magenta -nonewline;
	Write-Host ($env:ComputerName) -f Gray -nonewline;
	Write-Host ("@") -f Magenta -nonewline;
	Write-Host ($(Get-Location)) -f Yellow -nonewline;
	Write-Host ("@") -f Magenta -nonewline;
	Write-Host ("{0:yyyy:MM:dd-hh:mmtt}" -f (Get-Date)) -f Red -nonewline;
 
	$gitHead = git symbolic-ref HEAD
	if($gitHead.length -ne 0) {
		$postion = $gitHead.LastIndexOf("/")
		$status_string += "(" + $gitHead.Substring($postion+1) + ")"
		$stats = if ((git diff --shortstat).length -eq 0) { "" } else { (git diff --shortstat).Trim() }
		$status_string += [Environment]::NewLine + "[" + $stats  + "]$"
		
		<# $git_create_count = 0
		$git_update_count = 0
		$git_delete_count = 0
		
		git status | foreach {
			if($_ -match "modified:") {
				$git_update_count += 1
			}
			elseif($_ -match "deleted:") {
				$git_delete_count += 1
			}
			elseif($_ -match "added:") {
				$git_create_count += 1
			}
		}
		$status_string += " u:" + $git_update_count + " d:" + $git_delete_count + ">" #>
	}
	else{
		 $status_string += [Environment]::NewLine + "$"
	}
	Write-Host ($status_string) -nonewline -foregroundcolor Cyan
	return " "
}