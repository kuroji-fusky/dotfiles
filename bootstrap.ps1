#Requires -RunAsAdministrator

# Stuff that requires admin privilages for screwing around with the registry
Write-Output "Writing stuff to registry"
& .\pwsh\registry.ps1

winget import .\pwsh\winget.json --verbose

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

# ===================================
# Register custom command aliases
& .\pwsh\aliases.ps1

Write-Output "Debloating..."
& .\pwsh\debloat.ps1