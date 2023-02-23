# =================================================
# Stuff that requires admin privilages for screwing around with the registry

# Enable verbose log for shutdown, restart, login
$RD_VerboseLogging = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
Set-ItemProperty -Path $RD_VerboseLogging -Name "verbosestatus" -Value 1 -Type Dword -Force

# Show file extensions
$RD_FileExt = "KHCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
Set-ItemProperty -Path $RD_FileExt -Name "HideFileExt" -Value 0 -Type Dword -Force

# =================================================
# Install the shit I need lol
function SetupWorkspace {
  Write-Output "Installing your crap right now"
  winget import .\winget-programs.json

  # Install latest node version using nvm
  nvm install lts
  npm install --global yarn typescript serve pnpm
}

# Check if the winget command is available, just in case
if (Get-Command winget -ErrorAction SilentlyContinue) {
  SetupWorkspace
}
else {
  Add-AppXPackage -Path .\MicrosoftDesktopAppInstaller_8wekyb3d8bbwe.msixbundle
  SetupWorkspace
}

# =================================================
# Register custom command aliases
& $PSScriptRoot\pwsh\aliases.ps1