
# Stop-Process "portmaster*" -Force -PassThru
# Start-Sleep 3

# sc.exe start PortmasterCore
# Start-Sleep 2

$PMInstallDir = "$env:ProgramData\Safing\Portmaster"

Write-Output $PMInstallDir

start "" /min "$PMInstallDir\portmaster-start.exe" app --data="$PMInstallDir"