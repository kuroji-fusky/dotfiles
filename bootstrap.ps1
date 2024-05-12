#Requires -RunAsAdministrator

# Stuff that requires admin privilages for screwing around with the registry
Write-Output "Writing stuff to registry"
& .\pwsh\registry.ps1

#Write-Output "Installing your shit"
#winget import .\winget.json --verbose

# ===================================
# Install python and node stuff globally

# Install latest node version using nvm
nvm install lts
nvm use lts

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

npm install -g $NPM_Packages
python -m pip install -U $Python_Packages --verbose

# ===================================
# Setup git stuff
git config --global core.ignorecase false
git config --global color.ui true

# ===================================
# Register custom command aliases
& .\pwsh\aliases\git.ps1
& .\pwsh\aliases\scripts.ps1
& .\pwsh\aliases\system.ps1

Write-Output "Debloating..."
& .\pwsh\debloat.ps1