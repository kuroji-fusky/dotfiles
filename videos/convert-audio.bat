@echo off
setlocal disableDelayedExpansion

:: Check if FFmpeg is installed
where /Q ffmpeg
if errorlevel 1 (
    echo FFmpeg is not installed 
    pause
    goto ExitProg
)

:ProcessFiles
if "%~1"=="" (
    echo FEED ME A PRECIOUS VIDEO FILE PLZ
    pause
    goto ExitProg
)

:ConvertFile
setlocal enableDelayedExpansion
    for %%F in (%*) do (
      set "inputFile=%%~F"
      set "outputFile=%%~dpnF.wav"
        ffmpeg -i "!inputFile!" "!outputFile!" -y -hide_banner
    )
endlocal

echo.
echo.
echo Conversion complete!
echo.
echo.
pause
goto ExitProg

:ExitProg
exit /b
