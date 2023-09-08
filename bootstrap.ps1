#Requires -RunAsAdministrator

# Stuff that requires admin privilages for screwing around with the registry
Write-Output "Writing stuff to registry"

# Enable verbose log for shutdown, restart, login, etc
$RD_VerboseLogging = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
New-ItemProperty -Path $RD_VerboseLogging -Name "verbosestatus" -Value 1 -Type Dword -Force

# Show file extensions
$RD_ShowFileExt = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
New-ItemProperty -Path $RD_ShowFileExt -Name "HideFileExt" -Value 0 -Type Dword -Force

$WingetPrograms = @(
  # Redistributables and runtimes
  "Microsoft.DotNet.DesktopRuntime.6",
  "Microsoft.VCRedist.2010.x86",
  "Microsoft.VCRedist.2010.x64",
  "Microsoft.VCRedist.2012.x86",
  "Microsoft.VCRedist.2012.x64",
  "Microsoft.VCRedist.2013.x86",
  "Microsoft.VCRedist.2013.x64",
  
  # The good stuff
  "Git.Git",
  "Mozilla.Firefox",
  "Mozilla.Thunderbird",
  "Brave.Brave",
  "GitHub.GitHubDesktop",
  "7zip.7zip",
  "CoreyButler.NVMforWindows",
  "Docker.DockerDesktop",
  "nektos.act",
  "Python.Python.3.11",
  "GoLang.Go.1.19",
  "Rustlang.Rustup",
  "AutoHotkey.AutoHotkey",
  "IObit.IObitUnlocker",

  # Video stuff
  "VideoLAN.VLC",
  "HandBrake.HandBrake",
  "OBSProject.OBSStudio",
  "Gyan.FFmpeg",
  
  # Code editors/IDEs
  "Neovim.Neovim",
  "Microsoft.VisualStudioCode.Insiders",
  "Microsoft.VisualStudio.2022.Community",
  "JetBrains.PyCharm.Community",

  # Productivity and management
  "Notion.Notion",
  "Discord.Discord",
  "Telegram.TelegramDesktop",
  "Valve.Steam",
  "WinDirStat.WinDirStat",
  "voidtools.Everything",
  "Figma.Figma",
  "Google.Drive",
  
  # Miscellanous
  "Oracle.VirtualBox",

  # Fancy terminal stuff
  "JanDeDobbeleer.OhMyPosh",
  "Microsoft.PowerShell.Preview",
  "Microsoft.WindowsTerminal"
)

function SetupWorkspace {
  Write-Output "Installing your crap right now"
  Write-Output "Installing stuff via winget"

  foreach ($program in $WingetPrograms) {
    Write-Output "Installing $program..."
    winget install -e --id $program
  }

  # ===================================
  # Install python and node stuff globally

  # Install latest node version using nvm
  nvm install lts

  $NPM_Packages = @(
    "typescript",
    "yarn",
    "pnpm",
    "npkill"
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
& .\aliases.ps1
