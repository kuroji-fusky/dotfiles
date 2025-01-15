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

function gnb {
  $newBranch = $args[0]
  
  git branch $newBranch
  git checkout $newBranch
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

# TODO: make sure to ignore submodules defined from .gitmodules
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