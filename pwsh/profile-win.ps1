Get-ChildItem $env:USERPROFILE\gh\dotfiles\pwsh\aliases | ForEach-Object { . $_.FullName }

if (Get-Command -Name "oh-my-posh.exe" -ErrorAction SilentlyContinue) {
  oh-my-posh init pwsh --config "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/velvet.omp.json" | Invoke-Expression
} else {
  Write-Error "Failed to initialize Oh My Posh"
}