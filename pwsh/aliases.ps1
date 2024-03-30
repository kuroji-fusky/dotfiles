# =================================================
# ALIASES

Set-Alias -Name cdi -Value 'code-insiders'
Set-Alias -Name c -Value Clear-Host

# =================================================
# Navigate directories

function ~ { Set-Location ~ }
function .. { Set-Location .. }
function ... { Set-Location ../.. }
function .... { Set-Location ../../.. }
function crb { Clear-RecycleBin -Force }

Set-Alias -Name touch -Value New-Item

# =================================================
# Register `mkcd` command for Windows

function mkcd {
  # Check if the path already exists
  if (!(Test-Path -Path $args[0])) {
    mkdir $args[0]
  }

  Set-Location $args[0] -PassThru
}

$processesToClose = @(
  "AutoHotkey*",
  "Figma*",
  "Telegram*",
  "Discord*",
  "Notion*",
  "brave*",
  "firefox*",
  "thunderbird*",
  "steam*",
  "adobe*",
  "cc*",
  "google*",
  "GitHubDesktop*",
  "AfterFX*",
  "Code*",
  "photos*",
  "everything*"
)

function Stop-DefinedProcesses {
  param (
    [String[]] $ListOfProcesses
  )
  
  foreach ($process in $ListOfProcesses) {
    Get-Process $process -ErrorAction SilentlyContinue | Stop-Process -PassThru
  }
}

# =================================================
# Restart alias
function rst { 
  Stop-DefinedProcesses -ListOfProcesses $processesToClose
  shutdown -r -f -t 0
}

# =================================================
# Shutdown alias
function sst { 
  Stop-DefinedProcesses -ListOfProcesses $processesToClose
  shutdown -s -f -t 0
}

# =================================================
# Toggle theme alias
function ToggleTheme {
  $regDir = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize"
  $appKey = "AppsUseLightTheme"
  $sysKey = "SystemUsesLightTheme"

  $currentValue = Get-ItemProperty -Path $regDir -Name $appKey | Select-Object -exp $appKey
  $newValue = !$currentValue + 0
  
  $_prc_explorer = "explorer.exe"
  $_prc_taskmgr = "taskmgr.exe"

  Set-ItemProperty -Path $regDir -Name $appKey -Value $newValue -Type Dword -Force
  Set-ItemProperty -Path $regDir -Name $sysKey -Value $newValue -Type Dword -Force

  Stop-Process $_prc_explorer
  Start-Sleep -Seconds 0.33
  Start-Process $_prc_explorer

  if (Get-Process -Name $_prc_taskmgr -ErrorAction SilentlyContinue) {
    Stop-Process $_prc_taskmgr
    Start-Sleep -Seconds 0.33
    Start-Process $_prc_taskmgr
  }
}

Set-Alias -Name tt -Value ToggleTheme

# =================================================
# Add git aliases to make commiting code on the command line easier

Remove-Alias -Name gp -Force -ErrorAction SilentlyContinue
Remove-Alias -Name gc -Force -ErrorAction SilentlyContinue

function gaa { & git add --all }
function gb { 
  Write-Output ">> Local branches:"
  git branch
  Write-Output ">> Remote branches:"
  git branch --remote
}
function gc { & git commit -m $args[0] --verbose }
function gcn { & git commit -m $args[0] --no-verify --verbose }
function gcl { 
  $gitUrl = $args[0].ToString()
  $repoDir = $gitUrl.Split("/")[-1].Replace(".git", "")

  if (!$gitUrl.StartsWith("https://github.com")) {
    Write-Error "Not a valid git repo"
  }

  git clone  $gitUrl --verbose

  Set-Location $repoDir

  git fetch --all --verbose
}
function gch { & git checkout $args[0] }
function gcho { & git checkout --orphan $args[0] }
function gd { & git diff }
function gf { & git fetch --verbose }
function gfa { & git fetch --all --verbose }
function gpl { & git pull --verbose }
function gp { & git push --verbose }
function gpu { & git push --set-upstream $args[0] --verbose }
function grl { & git reflog . }
function gs { & git status -sb }
function gss { & git stash -u }
function gsa { & git stash apply }
function grc { 
  git rm -r --cached .
  git add -all
}

# =================================================
# Git function to update branch name from both local and origin
function Rename-GitBranch {
  param (
    [string] $oldBranch,
    [string] $newBranch
  )

  if (-not $oldBranch -or -not $newBranch) {
    Write-Host "Usage: Rename-GitBranch <oldBranch> <newBranch>"
    return
  }

  git branch -m $oldBranch $newBranch
  git fetch origin -v
  git branch -u "origin/$newBranch" $newBranch -v
  git remote set-head origin -a
}

Set-Alias -Name upb -Value Rename-GitBranch

# =================================================
# Common dev commands

function yi { yarn install }
function yd { yarn dev }
function yb { yarn build }
function ys { yarn start }
function yp { yarn preview }
