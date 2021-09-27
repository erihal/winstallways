# Setup profile file if not exists
If (!(Test-Path -Path $profile -Type Leaf)) {
    Write-Output "No PS profile exists at: $profile Creating file..."  | Write-Output
    New-Item -Path $profile -Force;
}

pwsh -Command { Get-Content "$PSScriptRoot\pwsh-winget-completion" >> $profile }
pwsh -Command { Get-Content "$PSScriptRoot\pwsh-dotnet-completion" >> $profile }
pwsh -Command { Write-Output "Set-PSReadLineOption -PredictionSource History" >> $profile }
pwsh -Command { Write-Output "Set-PSReadLineOption -PredictionViewStyle ListView" >> $profile } 
pwsh -Command { Write-Output "Set-PSReadLineOption -EditMode Windows" >> $profile }
pwsh -Command { Write-Output "oh-my-posh --init --shell pwsh --config \themes\hotstick.minimal.omp.json | Invoke-Expression" >> $profile };
pwsh -Command { Write-Output "sal ls ls.exe" >> $profile }

Write-Output "set git globals. if you fail, you'll have to fix it later" | Write-Output
pwsh -Command {
    $GLOBAL_GIT_USER_NAME=Read-Host "git config --global user.name"
    $GLOBAL_GIT_USER_EMAIL=Read-Host "git config --global user.email"
    git config --global user.name $GLOBAL_GIT_USER_NAME
    git config --global user.email $GLOBAL_GIT_USER_EMAIL
}