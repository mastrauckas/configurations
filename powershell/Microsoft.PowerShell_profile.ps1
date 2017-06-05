##Information on getting Posh-Git for Powershell go to:
#http://haacked.com/archive/2011/12/13/better-git-with-powershell.aspx/
#and http://haacked.com/archive/2011/12/19/get-git-for-windows.aspx/

.  ($PSScriptRoot + "/.powerShell/prompt_fuctions.ps1")
.  ($PSScriptRoot + "/.powerShell/global_aliases.ps1")
.  ($PSScriptRoot + "/.powerShell/global_exports.ps1")

$env:path += ";C:\Tools\Vim\vim74"
$env:path += ";C:\Tools\Git\cmd"
$env:path += ";C:\Tools\Git\bin;C:\Tools\Git\usr\bin"

function prompt {
    return  GetCustomPromptWithUnicode
}