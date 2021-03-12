function Install-DISTAzVSCodeExtension { 

    param (
        [String[]]$AdditionalExtensions = @()
    )

    $ErrorActionPreference = 'SilentlyContinue'
    
    $extensions = @('ms-vscode.powershell', 'msazurermtools.azurerm-vscode-tools', 'ms-vscode.azurecli') + $AdditionalExtensions
    
    foreach ( $extension in $extensions )
    { Invoke-Command -Scriptblock { & 'C:\Program Files\Microsoft VS Code\bin\code.cmd' --install-extension $extension } }
    
}