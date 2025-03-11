@echo off
setlocal
set "PM_DIR=%PROGRAMDATA%\Safing\Portmaster"
set "PM_SC=PortmasterCore"

title Reinit Portmaster

sc stop %PM_SC%

:CheckStopped
sc query %PM_SC% | findstr /C:"STATE" | findstr /C:"STOPPED" >nul
if %errorlevel% neq 0 (
    timeout 6 >nul
    sc query %PM_SC% | findstr /C:"STATE" | findstr /C:"STOP_PENDING" >nul

    if %errorlevel% neq 0 (
        taskkill /f /im "portmaster*"
    )
    goto :CheckStopped
)

sc start %PM_SC%

:CheckRunning
sc query %PM_SC% | findstr /C:"STATE" | findstr /C:"RUNNING" >nul
if %errorlevel% neq 1 (
    timeout 5 >nul
    goto :CheckRunning
)

start "" /min "%PM_DIR%\portmaster-start.exe" app --data=%PM_DIR%

timeout 6 >nul
taskkill -f -im "portmaster-app*"

endlocal
exit

