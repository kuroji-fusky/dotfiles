#Requires -RunAsAdministrator

$CurrentPSRootDir = "$PSScriptRoot\pwsh"
$BootstrapPartialsDir = "$CurrentPSRootDir\bootstrap-partials"
$SystemEnvPath = $env:USERPROFILE

# Thanks to this :3 https://stackoverflow.com/a/29424207/18905871
function Get-CheckCommand {
  param (
    [string]$CmdName
  )

  return [bool](Get-Command -Name $CmdName -ErrorAction SilentlyContinue)
}

# Stuff that requires admin privilages for screwing around with the registry
Write-Output "Writing stuff to registry"
& "$BootstrapPartialsDir\registry.ps1"

$SymLinkLocations = @{
  # <source> = <target>
  "$CurrentPSRootDir/.gitconfig" = "$SystemEnvPath/.gitconfig"
}

if (Get-CheckCommand -CmdName "winget") {
  Write-Output "Installing your shit"
  winget import "$CurrentPSRootDir\winget.json" --verbose
}
else {
  Write-Output "winget not installed"
}

# Install latest node version using nvm
if (Get-CheckCommand -CmdName "nvm") {
  nvm install lts
  nvm use lts
}

& "$BootstrapPartialsDir\install-global-deps.ps1"

# ===================================
# Register custom command aliases
& "$CurrentPSRootDir\aliases\git.ps1"
& "$CurrentPSRootDir\aliases\scripts.ps1"
& "$CurrentPSRootDir\aliases\system.ps1"
& "$CurrentPSRootDir\drive-size.ps1"

Write-Output "Debloating..."
& "$BootstrapPartialsDir\debloat.ps1"