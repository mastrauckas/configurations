function GetVirtualEnvironments {
    return $(split-path $env:VIRTUAL_ENV -leaf)
}