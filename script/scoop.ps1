Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"
# $PSDefaultParameterValues['*:ErrorAction']='Stop'


# scoop
$SCOOP_NOT_INSTALLED=Get-Command scoop -ErrorAction # SilentlyContinue;
if ($SCOOP_NOT_INSTALLED) {
	echo 'scoop is not installed' | Write-Error
	echo 'installing scoop to standard path if nothing else is set' | Write-Output
	Invoke-WebRequest -useb get.scoop.sh | Invoke-Expression;
}


echo "adding buckets" | Write-Output
scoop bucket add extras
scoop bucket add nonportable
scoop bucket add nerd-fonts https://github.com/matthewjberger/scoop-nerd-fonts
scoop bucket add scoop-completion https://github.com/Moeologist/scoop-completion
scoop bucket add spotify https://github.com/TheRandomLabs/Scoop-Spotify.git


echo "updating buckets" | Write-Output
scoop update

# Shell, terminal etc
# misc: posh-docker

scoop install tldr sudo busybox

scoop install scoop-search
echo "Invoke-Expression (&scoop-search --hook)" >> $profile;
echo "replacing scoop search with scoop-search. writing to pwsh profile..." | Write-Output

scoop install posh-git
Add-PoshGitToProfile;
echo "posh-git. writing to pwsh profile..." | Write-Output

scoop install scoop-completion
echo "Import-Module scoop-completion" >> $profile;
echo "adding scoop completion. writing to pwsh profile..." | Write-Output


# Font
sudo scoop install --global Meslo-NF
sudo scoop install --global Cascadia-Code
sudo scoop install --global CascadiaCode-NF-Mono
sudo scoop install --global CascadiaCode-NF


# Tools
scoop install spacesniffer


# Node
scoop install fnm
echo "fnm env --use-on-cd | Out-String | Invoke-Expression" >> $profile;
echo "installing fast node manager. writing to pwsh profile..." | Write-Output


# not installed
echo "consider installing:" | Write-Output
echo "optipng" | Write-Output
echo "bit" | Write-Output
echo "gifski" | Write-Output
echo "pandoc" | Write-Output


echo "`n"
echo "`n"
echo "Scooped:" | Write-Output
echo $(scoop export) | Write-Output


scoop install archwsl

pause