# Run this command if no execution policy error:
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

# Util function for output
function Write-Start {
    param($msg)
    Write-Host (">> " + $msg) -ForegroundColor Green; Write-Host
}

function Write-Done {
    Write-Host ("Done!") -ForegroundColor Blue; Write-Host
}

function Write-Warning {
    param($msg)
    Write-Host ("Warning: " + $msg) -ForegroundColor Yellow; Write-Host
}

# Start
Start-Process -Wait powershell -Verb runas -ArgumentList "Set-ItemPropety -Path REGISTRY::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Name ConsentPromptBehaviorAdmin -Value 0"

Write-Start -msg "Installing Scoop..."
if (Get-Command scoop -ErrorAction SilentlyContinue) {
    Write-Warning -msg "Scoop is already installed."
}
else {
    Set-ExecutionPolicy RemoteSigned -Scope CurrentUser # Optional: Needed to run remote script the first time
    irm get.scoop.sh | iex
}
Write-Done

Install packages
Write-Start -msg "Installing Scoop packages..."
scoop install git
scoop bucket add main
scoop bucket add extras
scoop bucket add nerd-fonts
scoop update
Write-Done

# Install utils packages
Write-Start -msg "Installing utils packages..."
# Browser
scoop install extras/googlechrome
scoop install extras/vscode
    
# Tool
scoop install main/vim
scoop install main/neovim

# Font
scoop install nerrd-fonts/JetBrainsMono-NF 
scoop install nerrd-fonts/JetBrains-Mono 

# All-in-one repackage for lastes Microsoft Visual C++ Redistributable Runtime
scoop install extras/vcredist-aio
Write-Done

# Configure Vim
$DestinationPath = "$env:USERPROFILE\AppData\Local\nvim"
if (-not (Test-Path $DestinationPath)) {
    New-Item -Path $DestinationPath -ItemType Directory -Force
}
Copy-Item -Path ".\neovim\*" -Destination $DestinationPath -Force
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim | `
    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force
nvim -E -s -u "$($env:USERPROFILE)\AppData\Local\nvim\init.vim" +PlugInstall +PlugUpdate +q
Write-Done

# Configure Vscode
## In my case, I have settings synced with GitHub so I don't need to do anything
# code --install-extension vscodevim.vim
# Write-Done
