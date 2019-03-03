# Put the this file in the current profile path.
#  An example is:  "C:\my-configs\configurations\powershell\profile.ps1"
Write-Host "Profile: $profile"

.  ($PSScriptRoot + "\scripts\prompt_fuctions.ps1")
.  ($PSScriptRoot + "\scripts\global_aliases.ps1")

.  ($PSScriptRoot + "\scripts\global_exports.ps1")

if([System.IO.File]::Exists(($PSScriptRoot + "\scripts\local_aliases.ps1"))){
   .  ($PSScriptRoot + "\scripts\local_aliases.ps1")
}

if([System.IO.File]::Exists(($PSScriptRoot + "\scripts\local_exports.ps1"))){
   .  ($PSScriptRoot + "\scripts\local_exports.ps1")
}

if([System.IO.File]::Exists(($PSScriptRoot + "\scripts\local_miscellaneous.ps1"))){
   .  ($PSScriptRoot + "\scripts\local_miscellaneous.ps1")
}

$env:path += ";C:\Tools\Vim\vim74"
$env:path += ";C:\Tools\Git\cmd"
$env:path += ";C:\Tools\Git\bin;C:\Tools\Git\usr\bin"

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
    Import-Module "$ChocolateyProfile"
}

function global:prompt {
    return  GetCustomPromptWithUnicode
}
