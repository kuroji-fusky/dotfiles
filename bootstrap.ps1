#Requires -RunAsAdministrator

# Stuff that requires admin privilages for screwing around with the registry
Write-Output "Writing stuff to registry"

# Enable verbose log for shutdown, restart, login, etc
$RD_VerboseLogging = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
New-ItemProperty -Path $RD_VerboseLogging -Name "verbosestatus" -Value 1 -Type Dword -Force

Write-Output "Debloating..."
& .\pwsh\debloat.ps1

# Show file extensions
$RD_ShowFileExt = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
New-ItemProperty -Path $RD_ShowFileExt -Name "HideFileExt" -Value 0 -Type Dword -Force

function SetupWorkspace {
  Write-Output "Installing your crap right now"
  Write-Output "Installing stuff via winget"

  winget import .\winget.json --verbose

  # ===================================
  # Install python and node stuff globally

  # Install latest node version using nvm
  nvm install lts

  $NPM_Packages = @(
    "typescript",
    "yarn",
    "pnpm",
    "npkill",
    "prettier"
  )

  $Python_Packages = @(
    "numpy",
    "autopep8",
    "yapf",
    "mypy",
    "requests",
    "beautifulsoup4",
    "pytube",
    "ffmpeg-python",
    "opencv-contrib-python",

    # Data science stuff
    "pandas",
    "matplotlib",
    "ipykernel"
  )

  npm install -g $NPM_Packages
  python -m pip install -U $Python_Packages --verbose

  # ===================================
  # Setup git stuff
  Write-Output "Setup almost done! All you need is to configure your Git credientals lol"

  $name = Read-Host "[git] Enter username "
  $email = Read-Host "[git] Enter email "

  git config --global user.name $name
  git config --global user.email $email
  git config --global core.ignorecase false
  git config --global color.ui true
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

# ===================================
# Register custom command aliases
& .\pwsh\aliases.ps1
