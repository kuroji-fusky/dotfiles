oh-my-posh init pwsh | Invoke-Expression

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
# =================================================
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

# ALIASES
# =================================================
Set-Alias -Name codei -Value 'code-insiders'

# Navigate directories
# =================================================
Set-Alias -Name "~" -Value Set-LocationHome 
Set-Alias -Name "cd-" -Value Set-LocationLast 
Set-Alias -Name "cd.." -Value Set-LocationUp 
Set-Alias -Name ".." -Value Set-LocationUp 
Set-Alias -Name "..." -Value Set-LocationUp2 
Set-Alias -Name "...." -Value Set-LocationUp3 

# Register `mkcd` command on Linux systems
# =================================================
function mkcd {
  # Check if the path already exists
  if(!(Test-Path -Path $args[0])) {
    mkdir $args[0]
  }

  cd $args[0] -PassThru
}

# Add git aliases to make commiting code on the command line easier uwu
# =================================================
function Get-GitStatus     { & git status -sb $args }
Set-Alias -Name gs -Value Get-GitStatus -Force -Option AllScope
function Get-GitRefLog     { & git reflog . $args }
Set-Alias -Name grl -Value Get-GitRefLog -Force -Option AllScope

function Get-GitBranch     { & git branch $args }
Set-Alias -Name gb -Value Get-GitBranch -Force -Option AllScope
function Get-GitCheckout     { & git checkout $args }
Set-Alias -Name gch -Value Get-GitCheckout -Force -Option AllScope

function Get-GitFetch      { & git fetch $args }
Set-Alias -Name gf -Value Get-GitFetch -Force -Option AllScope
function Get-GitFetchAll   { & git fetch --all $args }
Set-Alias -Name gf -Value Get-GitFetch -Force -Option AllScope
function Get-GitPull       { & git pull $args }
Set-Alias -Name gl -Value Get-GitPull -Force -Option AllScope
function Get-GitPush       { & git push $args }
Set-Alias -Name gp -Value Get-GitPush -Force -Option AllScope
function Get-GitAdd        { & git add --all $args }
Set-Alias -Name ga -Value Get-GitAdd -Force -Option AllScope
function Get-GitCommit     { & git commit -m $args }
Set-Alias -Name gc -Value Get-GitCommit -Force -Option AllScope

function Get-GitResetCache { & git rm -r --cached . $args; Get-GitAdd }
Set-Alias -Name gre -Value Get-GitResetCache -Force -Option AllScope