@echo off
echo.

REM check winget exists. TODO: install winget if missing?
where winget /Q
IF %ERRORLEVEL% NEQ 0 (
	echo winget not found in path
	echo.
	pause
	exit
)

winget source update

where pwsh /Q
IF %ERRORLEVEL% NEQ 0 (
	echo installing pwsh
	echo.
	winget install --id=Microsoft.PowerShell -e -h
	IF %ERRORLEVEL% NEQ 0 (
		echo failed to install pwsh. exit code %ERRORLEVEL%
		echo.
		pause
		exit
) else (
	echo pwsh already installed. skipping...
	echo.
)

start cmd /Q /C start pwsh .\script\prep-main.ps1 
echo. 
pause
exit