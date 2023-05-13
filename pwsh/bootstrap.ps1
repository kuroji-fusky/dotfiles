#Requires -RunAsAdministrator

# Stuff that requires admin privilages for screwing around with the registry
Write-Output "Writing stuff to registry"

# Enable verbose log for shutdown, restart, login, etc
$RD_VerboseLogging = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
Set-ItemProperty -Path $RD_VerboseLogging -Name "verbosestatus" -Value 1 -Type Dword -Force

# Show file extensions
$RD_FileExt = "KHCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
Set-ItemProperty -Path $RD_FileExt -Name "HideFileExt" -Value 0 -Type Dword -Force

function SetupWorkspace {
  Write-Output "Installing your crap right now"
  Write-Output "Installing stuff via winget"
  winget import .\winget.json

  # Install latest node version using nvm
  nvm install lts
  npm install --global yarn typescript serve pnpm

  # Global python stuff
  python -m pip install -U autopep8 yapf poetry opencv-python

  # Setup git stuff
  Write-Output "Setup almost done!"

  $name = Read-Host "Enter username: "
  $email = Read-Host "Enter email: "

  git config --global user.name $name
  git config --global user.email $email
  git config --global core.ignorecase false
}

# Check if the winget command is available, just in case
# of a fresh install
if (Get-Command winget -ErrorAction SilentlyContinue) {
  Write-Output "winget not detected on your system, installing..."
  Add-AppxPackage -RegisterByFamilyName -MainPackage Microsoft.DesktopAppInstaller_8wekyb3d8bbwe
  SetupWorkspace
}
else {
  SetupWorkspace
}

# ———————————————————————————————————————
# Register custom command aliases
& $PSScriptRoot\powershell\aliases.ps1