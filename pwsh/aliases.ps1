# =================================================
# ALIASES

Set-Alias -Name cdi -Value 'code-insiders'
Set-Alias -Name c -Value Clear-Host

# =================================================
# Navigate directories

function ~ { Set-Location ~ }
function .. { Set-Location .. }
function ... { Set-Location ../.. }
function crb { Clear-RecycleBin -Force }

# =================================================
# Register `mkcd` command for Windows

function mkcd {
  # Check if the path already exists
  if (!(Test-Path -Path $args[0])) {
    mkdir $args[0]
  }

  Set-Location $args[0] -PassThru
}

# =================================================
# Restart dat shit

function Restart-Compooter { shutdown -r -f -t 0 }
Set-Alias -Name rst -Value Restart-Compooter

# =================================================
# Toggle theme alias

function ToggleTheme {
  $regDir = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize"
  $appKey = "AppsUseLightTheme"
  $sysKey = "SystemUsesLightTheme"

  $currentValue = Get-ItemProperty -Path $regDir -Name $appKey | Select-Object -exp $appKey
  $newValue = !$currentValue + 0

  Set-ItemProperty -Path $regDir -Name $appKey -Value $newValue -Type Dword -Force
  Set-ItemProperty -Path $regDir -Name $sysKey -Value $newValue -Type Dword -Force
}

Set-Alias -Name tt -Value ToggleTheme

# =================================================
# Add git aliases to make commiting code on the command line easier

function gaa { git add --all }
function gb { git branch }
function gc { git commit -m $args[0] --verbose }
function gcl { git clone -m $args[0] --verbose }
function gch { git checkout $args[0] }
function gcho { git checkout --orphan $args[0] --verbose }
function gf { git fetch --verbose }
function gfa { git fetch --all --verbose }
function gpl { git pull }
function gps { git push }
function gpu { git push --set-upstream $args[0] --verbose }
function grf { git reflog . }
function gs { git status -sb }
function gss { git stash -u }
function gsa { git stash apply }
function grc { 
  git rm -r --cached .
  git add -all
}

# =================================================
# Git function to update branch name from both local and origin
function Rename-GitBranch {
  param (
    [string]$oldBranch,
    [string]$newBranch
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

# Yiff OwO
function yif { yarn install --force }
function yd { yarn dev }
function yb { yarn build }
function ys { yarn start }
function yp { yarn preview }
