# =================================================
# ALIASES
Set-Alias -Name codei -Value 'code-insiders'

# =================================================
# Navigate directories
Set-Alias -Name "~" -Value Set-LocationHome 
Set-Alias -Name "cd-" -Value Set-LocationLast 
Set-Alias -Name "cd.." -Value Set-LocationUp 
Set-Alias -Name ".." -Value Set-LocationUp 
Set-Alias -Name "..." -Value Set-LocationUp2 
Set-Alias -Name "...." -Value Set-LocationUp3 

# =================================================
# Register `mkcd` command for Windows
function mkcd {
  # Check if the path already exists
  if (!(Test-Path -Path $args[0])) {
    mkdir $args[0]
  }

  Set-Location $args[0] -PassThru
}

New-Alias mkcd

# =================================================
# Add git aliases to make commiting code on the command line easier uwu

function RegisterAlias {
  param (
    [string]$alias,
    $func
  )

  if (!(Get-Alias -Name $alias -ErrorAction Ignore)) {
    Write-Output "It seems like the alias '$alias' is not registered; setting alias $alias"
    Set-Alias -Name $alias -Value $func -Force -Option AllScope
  }
  else {
    Write-Output "Alias '$alias' is already registered!"
  }
}

RegisterAlias -alias "gaa"   -func -scriptBlockToCall { & git add --all }
RegisterAlias -alias "gb"    -func -scriptBlockToCall { & git branch }
RegisterAlias -alias "gc"    -func -scriptBlockToCall { & git commit -m }
RegisterAlias -alias "gcl"   -func -scriptBlockToCall { & git clone }
RegisterAlias -alias "gch"   -func -scriptBlockToCall { & git checkout }
RegisterAlias -alias "gcho"  -func -scriptBlockToCall { & git checkout --orphan }
RegisterAlias -alias "gf"    -func -scriptBlockToCall { & git fetch }
RegisterAlias -alias "gfl"   -func -scriptBlockToCall { & gf && gpl }
RegisterAlias -alias "gpl"   -func -scriptBlockToCall { & git pull }
RegisterAlias -alias "gp"    -func -scriptBlockToCall { & git push }
RegisterAlias -alias "gpu"   -func -scriptBlockToCall { & git push --set-upstream }
RegisterAlias -alias "grl"   -func -scriptBlockToCall { & git reflog . }
RegisterAlias -alias "grc"   -func -scriptBlockToCall { & git rm -r --cached . }
RegisterAlias -alias "gs"    -func -scriptBlockToCall { & git status -sb }
RegisterAlias -alias "gsync" -func -scriptBlockToCall { & grc && gaa }