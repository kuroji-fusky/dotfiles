#
# Some code provided by Sycnex's Windows10Debloater repo.
# https://github.com/Sycnex/Windows10Debloater/blob/master/Windows10Debloater.ps1
#

Write-Output "Changing some registry to turbolize your PC!"
$DWORD = "DWORD" 

# Disables “Shake to Minimize”
New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "DisallowShaking" -Value "1" -PropertyType $DWORD

# Disable Startup delay
New-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" -Name Serialize
New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Serialize" -Name "StartupDelayInMSec" -Value "0" -PropertyType $DWORD

# Verbose Mode
New-ItemProperty -Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Policies\System"  -Name "VerboseMode" -Value "1" -PropertyType $DWORD

# Lower Shutdown Times
#
# INFO: Normally, it takes forever to shutdown because Windows tries to kills processes that is currently running.
# It may take while to do this when you're working on a document, an unsaved data, or something like that, this
# speeds up the process!
Set-ItemProperty -path "HKLM:\SYSTEM\CurrentControlSet\Control" -Name "WaitToKillServiceTimeout" -Value "1000"

# Dark Theme (definitely a must)
New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\" -Name "Personalize"
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "AppsUseLightTheme" -Value "0" -PropertyType $DWORD

New-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\" -Name "Personalize"
New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "AppsUseLightTheme" -Value "0" -PropertyType $DWORD

# Disables Cortana because no one uses this lmao
$bitch1 = "HKCU:\SOFTWARE\Microsoft\Personalization\Settings"
$bitch2 = "HKCU:\SOFTWARE\Microsoft\InputPersonalization"
$bitch3 = "HKCU:\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore"
If (!(Test-Path $bitch1)) {
    New-Item $bitch1
}
Set-ItemProperty $bitch1 AcceptedPrivacyPolicy -Value 0 
If (!(Test-Path $bitch2)) {
    New-Item $bitch2
}
Set-ItemProperty $bitch2 RestrictImplicitTextCollection -Value 1 
Set-ItemProperty $bitch2 RestrictImplicitInkCollection -Value 1 
If (!(Test-Path $bitch3)) {
    New-Item $bitch3
}
Set-ItemProperty $bitch3 HarvestContacts -Value 0

# Removes the "3D Objects" in explorer because I don't find it useful
$Objects32 = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}"
$Objects64 = "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}"
If (Test-Path $Objects32) {
    Remove-Item $Objects32 -Recurse 
}
If (Test-Path $Objects64) {
    Remove-Item $Objects64 -Recurse 
}