
# WSL
$client=new-object System.Net.WebClient
echo "more WSL stuff now" | Write-Output
echo "installing kernel update" | Write-Output
$client.DownloadFile("https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi", "$env:TEMP/wsl_update_x64.msi")
Start-Process msiexec.exe -Wait -ArgumentList '/I $env:TEMP/wsl_update_x64.msi /quiet'

echo "settings wsl default version to 2" | Write-Output
wsl --set-default-version 2 | Out-Null


# Winget stuff
Write-Output "time for winget installs stuff"
pwsh -Command .\script\winget.ps1


# Scoop
Write-Output "time to scoop"
pwsh -Command .\script\scoop.ps1


# start wsl
Write-Output "Starting Debian, please configure your Linux username and password and then close the Debian window to continue..."
pwsh -Command .\script\run-deb.ps1


# more more more
Write-Output "adding ps modules"  
pwsh -Command .\install-pwsh-modules.ps1

Write-Output "setting up pwsh profile"
pwsh -Command .\write-to-pwsh-profile.ps1

Write-Output "remember to config Auto Dark / Night mode`n`n"
Write-Output "close and reopen (windows terminal) all shells for path to resolve"

Write-Output "fix settings in WT" 
Write-Output "run wsl to check default distro`n`n"

Write-Output "Configure bad browsers with:" "https://www.qwant.com/?q=%s" "https://duckduckgo.com/?q=%s"
Write-Output "Install Redirector in browsers and load config from:" "https://gist.githubusercontent.com/erihal/8dd74e110d818d2ccdde962fdce35fbe/raw/ `n`n"