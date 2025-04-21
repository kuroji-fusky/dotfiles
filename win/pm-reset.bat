@echo off
@rem A script to kill and relaunch Portmaster
@rem Why? Sometimes, any network activity won't go through due to some issues with PM
@rem in particular. So this script does the usual "turn on and turn off" method.
@rem 
@rem It also contains safeguards to force kill if `sc` couldn't kill it.
setlocal

set "PM_DIR=%PROGRAMDATA%\Safing\Portmaster"
set "PM_SC=PortmasterCore"

title Reinit Portmaster

net session >nul 2>&1
if %errorlevel% neq 0 (
    echo This script requires admin privilages, please re-run this script. *puppy eyes*
    echo.
    pause
    goto term
)

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

cmd.exe /c start "" /min "%PM_DIR%\portmaster-start.exe" app --data=%PM_DIR%

timeout 6 >nul
taskkill -f -im "portmaster-app*"
goto term
endlocal

:term
exit /b