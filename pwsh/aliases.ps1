# =================================================
# ALIASES

Set-Alias -Name codei -Value 'code-insiders'
Set-Alias -Name c -Value Clear-Host

# =================================================
# Navigate directories

function Set-LocationHome { & Set-Location ~ }
Set-Alias -Name "~" -Value Set-LocationHome

function Set-LocationUp { & Set-Location .. }
Set-Alias -Name "cd.." -Value Set-LocationUp
Set-Alias -Name ".." -Value Set-LocationUp

function Set-LocationUp2 { & Set-Location ../.. }
Set-Alias -Name "..." -Value Set-LocationUp2

function Set-GithubDir { & Set-Location ~/GitHub }
Set-Alias -Name kgh -Value Set-GithubDir

# =================================================
# Register `mkcd` command for Windows

function mkcd {
  # Check if the path already exists
  if (!(Test-Path -Path $args[0])) {
    mkdir $args[0]
  }

  Set-Location $args[0] -PassThru
}

Set-Alias -Name mkcd -Value mkcd

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

  taskkill.exe -f -im explorer.exe
  Start-Process explorer
}

Set-Alias -Name tt -Value ToggleTheme

# =================================================
# Add git aliases to make commiting code on the command line easier

function GitAddAll { & git add --all }
Set-Alias -Name ga -Value GitAddAll -Force -Option AllScope

function GitBranch { & git branch }
Set-Alias -Name gb -Value GitBranch -Force -Option AllScope

function GitCommit { & git commit -m }
Set-Alias -Name gc -Value GitCommit -Force -Option AllScope

function GitClone { & git clone }
Set-Alias -Name gcl -Value GitClone -Force -Option AllScope

function GitCheckout { & git checkout }
Set-Alias -Name gch -Value GitCheckout -Force -Option AllScope

function GitCheckoutOrphan { & git checkout --orphan }
Set-Alias -Name gcho -Value GitCheckoutOrphan -Force -Option AllScope

function GitFetch { & git fetch --verbose }
Set-Alias -Name gf -Value GitFetch -Force -Option AllScope

function GitFetchAll { & git fetch --all --verbose }
Set-Alias -Name gfa -Value GitFetchAll -Force -Option AllScope

function GitPull { & git pull }
Set-Alias -Name gl -Value GitPull -Force -Option AllScope

function GitPush { & git push }
Set-Alias -Name gp -Value GitPush -Force -Option AllScope

function GitPushUpstream { & git push --set-upstream }
Set-Alias -Name gpu -Value GitPushUpstream -Force -Option AllScope

function GitRefLog { & git reflog . }
Set-Alias -Name grf -Value GitRefLog -Force -Option AllScope

function GitStatus { & git status -sb }
Set-Alias -Name gs -Value GitStatus -Force -Option AllScope

function GitRmCache { & git rm -r --cached . }
function GitResetCache { & GitRmCache && GitAddAll }
Set-Alias -Name gra -Value GitResetCache -Force -Option AllScope

# =================================================
# Common dev commands

# Yiff OwO
function YarnInstallForce { & yarn install --force }
Set-Alias -Name yif -Value YarnInstallForce

function YarnDev { & yarn dev }
Set-Alias -Name yd -Value YarnDev

function YarnBuild { & yarn build }
Set-Alias -Name yb -Value YarnBuild

function YarnStart { & yarn start }
Set-Alias -Name ys -Value YarnStart

function YarnPreview { & yarn preview }
Set-Alias -Name yp -Value YarnPreview
