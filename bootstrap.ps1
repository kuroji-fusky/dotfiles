#Requires -RunAsAdministrator


# Thanks to this :3 https://stackoverflow.com/a/29424207/18905871
function Get-CheckCommand {
  param (
    [string]$CmdName
  )

  return [bool](Get-Command -Name $CmdName -ErrorAction SilentlyContinue)
}

$CurrentPSRootDir = "$PSScriptRoot\pwsh"

# Stuff that requires admin privilages for screwing around with the registry
Write-Output "Writing stuff to registry"
& "$CurrentPSRootDir\registry.ps1"

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

if (Get-CheckCommand "npm") {
  npm install -g $NPM_Packages
}
else {
  Write-Output "Node/npm not installed; won't be installing npm packages"
}

if (
  (
    (Get-CheckCommand "python") -or `
    (Get-CheckCommand "python3") -or `
    (Get-CheckCommand "py")
  ) -and `
  (
    (Get-CheckCommand "pip") -or `
    (Get-CheckCommand "pip3")
  )
) {
  python -m pip install -U $Python_Packages --verbose
}
else {
  Write-Output "Python not installed; won't be installing pip packages"
}

# ===================================
# Register custom command aliases
& "$CurrentPSRootDir\aliases\git.ps1"
& "$CurrentPSRootDir\aliases\scripts.ps1"
& "$CurrentPSRootDir\aliases\system.ps1"

Write-Output "Debloating..."
& "$CurrentPSRootDir\debloat.ps1"