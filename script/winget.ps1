# start pwsh -Command {( ) | foreach { winget install --id=$_ -e }}; create function

# Configure winget
# https://github.com/microsoft/winget-cli/blob/master/doc/Settings.md

# Silent installs
(
    "Microsoft.Teams", 
    "SlackTechnologies.Slack", 
    "Bitwarden.Bitwarden",
    "OpenWhisperSystems.Signal.Beta",
    "Mozilla.Firefox",
    "Mozilla.FirefoxDeveloperEdition",
    "BraveSoftware.BraveBrowser",
    "Opera.OperaGX",
    "VivaldiTechnologies.Vivaldi",
    "Microsoft.EdgeDev",
    "EdgeDeflector",
    "Microsoft.WindowsTerminal",
    "JanDeDobbeleer.OhMyPosh",
    "chrisant996.Clink",
    "Microsoft.Powertoys",
    "voidtools.Everything",
    "7zip.7zip",
    "flux.flux",
    "Microsoft.dotnet",
    "Microsoft.AzureCLI",
    "Microsoft.AzureCosmosEmulator",
    "Microsoft.AzureStorageEmulator",
    "Microsoft.AzureStorageExplorer",
    "OBSProject.OBSStudio",
    "XSplit.VCam",
    "VideoLAN.VLC",
    "Spotify.Spotify",
    "SublimeHQ.SublimeText.4",
    "Microsoft.VisualStudioCode",
    "Microsoft.VisualStudio.2019.Professional",
    "Microsoft.VisualStudio.2022.Enterprise-Preview",
    "Armin2208.WindowsAutoNightMode",
    "Debian.Debian",
    "zhaopengme.gitnote",
    "GitHub.cli"
) | ForEach-Object {
    winget install --id=$_ -e
}



# Interactive installs
( 
    "Git.Git"
) | foreach { 
    winget install --id=$_ -e -i
}

# Not installed
Write-Output "consider installing:" "harmony" "runjs" "obsidian" "AutoHotkey"