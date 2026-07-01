if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
  Write-Output "Requires admin to run you dingus"
  exit 1
}

# Thanks to this :3 https://stackoverflow.com/a/29424207/18905871
function Get-CheckCommand {
  param (
    [string]$CmdName
  )

  return [bool](Get-Command -Name $CmdName -ErrorAction SilentlyContinue)
}

$SystemEnvPath = $env:USERPROFILE

$CurrentPSRootDir = "$PSScriptRoot\scripts\pwsh"
$ConfigsPath = "$PSScriptRoot\configs\windows"
$BootstrapPartialsDir = "$CurrentPSRootDir\bootstrap-partials"

$DocumentsPath = "$SystemEnvPath\Documents\PowerShell"

# Stuff that requires admin privilages for screwing around with the registry
Write-Output "Writing stuff to registry"
& "$BootstrapPartialsDir\registry.ps1"

$SymLinkLocations = @(
  # <link> = <target>
  @("$CurrentPSRootDir\.gitconfig", "$SystemEnvPath\.gitconfig"),
  @("$ConfigsPath\Microsoft.PowerShell_profile.ps1", "$DocumentsPath\Microsoft.PowerShell_profile.ps1"),
  @("$ConfigsPath\powershell.config.json", "$DocumentsPath\powershell.config.json")
)

foreach ($location in $SymLinkLocations) {
  $symlinkPath, $target = $location

  Write-Output "Linking $symlinkPath -> $target"

  New-Item -ItemType SymbolicLink -Path $target -Target $symlinkPath -ErrorAction Continue
}

if (Get-CheckCommand -CmdName "winget") {
  Write-Output "Installing your shit"
  winget import "$ConfigsPath\winget.json" --verbose
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