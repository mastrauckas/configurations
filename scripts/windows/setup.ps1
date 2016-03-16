$dotDirectory = (Get-Item "..\..\dotfiles").FullName

$fromFile = join-path (get-item ".").FullName ".vsvimrc"
$toFile = join-path (get-item $env:home).FullName ".vsvimrc"
(Get-Content $fromFile ).Replace("<directory>",$dotDirectory) | Out-File $toFile

$fromFile = join-path (get-item ".").FullName ".vimrc"
$toFile = join-path (get-item $env:home).FullName ".vimrc"
(Get-Content $fromFile ).Replace("<directory>",$dotDirectory) | Out-File -Encoding UTF8 $toFile
