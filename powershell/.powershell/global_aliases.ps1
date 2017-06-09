If ((Test-Path alias:open) -eq $true) {
    Remove-Item alias:\open
}

New-Alias -name open -value ii

#Make alias with parameters into functions
function ll {
    Get-ChildItem | Sort-Object LastWriteTime
 }

 function lo {
     Get-ChildItem | Foreach-Object { Get-Acl $_ }
 }

function target($symlink) {
    Get-Item $symlink | Select-Object -ExpandProperty Target
}

function eval($string) {
     Invoke-Expression $string
}

function RunSsh($userIdentity ) {
   $agent=ssh-agent
   $position=$agent[0].IndexOf("=")
   $ending=$agent[0].IndexOf(";")

   $variableStartPosition=$agent[0].IndexOf("export")
   $variableEndPosition=$agent[0].LastIndexOf(";")
   $variableName=$agent[0].Substring($variableStartPosition+7,$variableEndPosition-$variableStartPosition-7)
   [Environment]::SetEnvironmentVariable($variableName, $agent[0].Substring($position+1,$ending-$position-1))

   $position=$agent[1].IndexOf("=")
   $ending=$agent[1].IndexOf(";")

   $variableStartPosition=$agent[1].IndexOf("export")
   $variableEndPosition=$agent[1].LastIndexOf(";")
   $variableName=$agent[1].Substring($variableStartPosition+7,$variableEndPosition-$variableStartPosition-7)
   [Environment]::SetEnvironmentVariable($variableName, $agent[1].Substring($position+1,$ending-$position-1))

   if($userIdentity.Length -eq 0) {
      ssh-add
   } else {
      ssh-add $userIdentity
   }
}


