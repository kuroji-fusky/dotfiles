Remove-Item Alias:sv -Force -ErrorAction SilentlyContinue
Get-ChildItem $env:USERPROFILE\gh\dotfiles\scripts\pwsh\aliases | ForEach-Object { . $_.FullName }

oh-my-posh init pwsh --config "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/refs/heads/main/themes/atomic.omp.json" | Invoke-Expression