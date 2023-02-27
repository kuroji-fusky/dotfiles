#Requires -RunAsAdministrator

if (!(Test-Path -Path ".\winget-programs.json")) {
  Write-Error "winget-programs.json not found, you failure"
  Exit 1
}

# ———————————————————————————————————————
# Stuff that requires admin privilages for screwing around with the registry
Write-Output "Writing stuff to registry"

# Enable verbose log for shutdown, restart, login, etc
$RD_VerboseLogging = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
Set-ItemProperty -Path $RD_VerboseLogging -Name "verbosestatus" -Value 1 -Type Dword -Force

# Show file extensions
$RD_FileExt = "KHCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
Set-ItemProperty -Path $RD_FileExt -Name "HideFileExt" -Value 0 -Type Dword -Force

# ———————————————————————————————————————
# Install the shit I need lol

# Check if the winget command is available, just in case
# for some old-ass Windows 10 systems
if (Get-Command winget -ErrorAction SilentlyContinue) {
  Write-Output "winget not detected, installing..."
  SetupWorkspace
}
else {
  Add-AppxPackage -RegisterByFamilyName -MainPackage Microsoft.DesktopAppInstaller_8wekyb3d8bbwe
  SetupWorkspace
}

function SetupWorkspace {
  Write-Output "Installing your crap right now"
  winget import .\winget-programs.json

  # Install latest node version using nvm
  nvm install lts
  
  npm install --global yarn typescript serve pnpm
  python -m pip install -U autopep8 yapf
}

# ———————————————————————————————————————
# Register custom command aliases
& $PSScriptRoot\powershell\aliases.ps1