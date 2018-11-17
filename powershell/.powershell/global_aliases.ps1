If ((Test-Path alias:open) -eq $true) {
    Remove-Item alias:\open
}

New-Alias -name open -value ii


# git alias
function gtc { git commit }
function gtcm($message) { git commit -m $message }
function gta($add) { git add $add }
function gtac($message) { git commit -am $message }
function gts { git status }
function gtd($diffs) { git diff $diffs }
function gtds { git diff --staged }
function gtph { git push }
function gtpl { git pull }
function gtco($checkout) { git checkout $checkout }

# VS Code Aliases
function codei($open) { code-insiders $open }
function codeis($open) { code-insiders --disable-gpu$open }

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
    $agent = ssh-agent
    $position = $agent[0].IndexOf("=")
    $ending = $agent[0].IndexOf(";")

    $variableStartPosition = $agent[0].IndexOf("export")
    $variableEndPosition = $agent[0].LastIndexOf(";")
    $variableName = $agent[0].Substring($variableStartPosition + 7, $variableEndPosition - $variableStartPosition - 7)
    [Environment]::SetEnvironmentVariable($variableName, $agent[0].Substring($position + 1, $ending - $position - 1))

    $position = $agent[1].IndexOf("=")
    $ending = $agent[1].IndexOf(";")

    $variableStartPosition = $agent[1].IndexOf("export")
    $variableEndPosition = $agent[1].LastIndexOf(";")
    $variableName = $agent[1].Substring($variableStartPosition + 7, $variableEndPosition - $variableStartPosition - 7)
    [Environment]::SetEnvironmentVariable($variableName, $agent[1].Substring($position + 1, $ending - $position - 1))

    if ($userIdentity.Length -eq 0) {
        ssh-add
    }
    else {
        ssh-add $userIdentity
    }
}


