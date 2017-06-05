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