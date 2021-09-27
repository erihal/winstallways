$debExec=Resolve-Path "$env:LOCALAPPDATA/Microsoft/WindowsApps/debian*.exe"
Start-Process $debExec -Wait