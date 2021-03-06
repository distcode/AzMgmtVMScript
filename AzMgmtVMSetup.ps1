$funcPS7 = { function Install-distPS7 {
        #
        # Install PowerShell 7.0
        #
        try {
            # Invoke-Expression -Command "& { $(Invoke-RestMethod https://aka.ms/install-powershell.ps1) } -UseMSI -Quiet -AddExplorerContextMenu -EnablePSRemoting" 
            Write-Eventlog -Message 'Installing PS7 ...' -Logname PSScript -Source CustomScriptExtension -EventID 7 -EntryType Information
            # Invoke-Command -Scriptblock { Invoke-Expression "& { $(Invoke-RestMethod https://aka.ms/install-powershell.ps1) } -UseMSI -Quiet -AddExplorerContextMenu -EnablePSRemoting" }
            powershell.exe -command { choco install powershell-core --install-arguments='"ADD_EXPLORER_CONTEXT_MENU_OPENPOWERSHELL=1 REGISTER_MANIFEST=1 ENABLE_PSREMOTING=1"' -y }
        }
        catch {
            Out-Host -InputObject 'Error PS7 installation'
            Write-Eventlog -Message 'Error Installing PS7 ...' -Logname PSScript -Source CustomScriptExtension -EventID 9 -EntryType Information

        }
    } }
$funcAzCLI = { function Install-distAzCLI {
        #
        # Install Azure CLI
        #
        try {
            Write-Eventlog -Message 'Installing AzCLI ...' -Logname PSScript -Source CustomScriptExtension -EventID 7 -EntryType Information
            Invoke-WebRequest -Uri https://aka.ms/installazurecliwindows -OutFile "$env:Temp\AzureCLI.msi" 
            Start-Process msiexec.exe -Wait -ArgumentList "/I $env:Temp\AzureCLI.msi /quiet"
            Remove-Item "$env:temp\AzureCLI.msi" -Force
        }
        catch {
            Out-Host -InputObject 'Error Az CLI Installation'
            Write-Eventlog -Message 'Error Installing AzCLI ...' -Logname PSScript -Source CustomScriptExtension -EventID 9 -EntryType Information
        }
    } }
$funcAzPSModules = { function Install-distAzPSModules {
        #
        # Install Azure PowerShell Modules
        #
        try {
            Write-Eventlog -Message 'Installing AzPS Modules ...' -Logname PSScript -Source CustomScriptExtension -EventID 7 -EntryType Information
            powershell.exe -command { choco install az.powershell -y } 
        }
        catch {
            Out-Host -InputObject 'Error PS Module Installation'
            Write-Eventlog -Message 'Error Installing AzPS Modules ...' -Logname PSScript -Source CustomScriptExtension -EventID 9 -EntryType Information
        }
    } }
$funcChrome = { function Install-distChrome {
        #
        # Install Chrome
        #

        try {
            Write-Eventlog -Message 'Installing Chrome ...' -Logname PSScript -Source CustomScriptExtension -EventID 7 -EntryType Information
            powershell.exe -command { choco install googlechrome  -y }
        }
        catch {
            Out-Host -InputObject 'Error Crome installation'
            Write-Eventlog -Message 'Error Installing Chrome ...' -Logname PSScript -Source CustomScriptExtension -EventID 9 -EntryType Information
        }
    } }
$funcEdge = { function Install-distEdge {
        #
        # Install Edge
        #
        try {
            Write-Eventlog -Message 'Installing Edge ...' -Logname PSScript -Source CustomScriptExtension -EventID 7 -EntryType Information
            powershell.exe -command { choco install microsoft-edge -y  }
        }
        catch {
            Out-Host -InputObject 'Error Edge installation'
            Write-Eventlog -Message 'Error Installing Edge ...' -Logname PSScript -Source CustomScriptExtension -EventID 9 -EntryType Information
        }
    } }
$funcFirefox = { function Install-distFirefox {
        #
        # Install Firefox
        #
        try {
            Write-Eventlog -Message 'Installing Firefox ...' -Logname PSScript -Source CustomScriptExtension -EventID 7 -EntryType Information
            powershell.exe -command { choco install firefox -y  }
        }
        catch {
            Out-Host -InputObject 'Error Firefox installation'
            Write-Eventlog -Message 'Error Installing Firefox ...' -Logname PSScript -Source CustomScriptExtension -EventID 9 -EntryType Information
        }
    } }
$funcVSCode = { function Install-distVSCode {
        #
        # Install VSCode
        #
        try { 
            Write-Eventlog -Message 'Installing VSCode ...' -Logname PSScript -Source CustomScriptExtension -EventID 7 -EntryType Information
            powershell.exe -command { choco install vscode -y }
        }
        catch {
            Out-Host -InputObject 'Error VSCode installation.'
            Write-Eventlog -Message 'Error Installing VSCode ...' -Logname PSScript -Source CustomScriptExtension -EventID 9 -EntryType Information
        }
    } }
$funcGIT = { function Install-distGIT {
        #
        # Install Git, Sysinternals
        #
        try {
            Write-Eventlog -Message 'Installing Git ...' -Logname PSScript -Source CustomScriptExtension -EventID 7 -EntryType Information
            powershell.exe -command { choco install git -y }
        }
        catch {
            Out-Host -InputObject 'Error Git Installation'
            Write-Eventlog -Message 'Error Installing Git ...' -Logname PSScript -Source CustomScriptExtension -EventID 9 -EntryType Information
        }
    } }

$funcStorageExplorer = { function Install-distStorageExplorer {
        #
        # Install Git, Sysinternals
        #
        try {
            Write-Eventlog -Message 'Installing Storage Explorer ...' -Logname PSScript -Source CustomScriptExtension -EventID 7 -EntryType Information
            powershell.exe -command { choco install microsoftazurestorageexplorer -y }
        }
        catch {
            Out-Host -InputObject 'Error Storage Explorer Installation'
            Write-Eventlog -Message 'Error Installing Storage Explorer ...' -Logname PSScript -Source CustomScriptExtension -EventID 9 -EntryType Information
        }
    } }


#region Preparation
$ErrorActionPreference = 'Stop'

if ( -not ((Get-EventLog -List).Log -contains 'PSScript' )) {
    New-EventLog -LogName PSScript -Source CustomScriptExtension
}

Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force

Set-ExecutionPolicy Bypass -Scope Process -Force;
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# $cred = New-Object -TypeName pscredential -ArgumentList 'localadmin',(ConvertTo-SecureString -String 'securePa$$w0rd' -AsPlainText -Force)
#endregion Preparation

#
# Main
#

Start-Job -ScriptBlock { Install-distPS7 } -InitializationScript $funcPS7
Start-Job -ScriptBlock { Install-distAzPSModules } -InitializationScript $funcAzPSModules
Start-Job -ScriptBlock { Install-distVSCode } -InitializationScript $funcVSCode
Start-Job -ScriptBlock { Install-distGIT } -InitializationScript $funcGIT
Start-Job -ScriptBlock { Install-distStorageExplorer } -InitializationScript $funcStorageExplorer
Get-Job | Wait-Job

Start-Job -ScriptBlock { Install-distChrome } -InitializationScript $funcChrome
Get-Job | Wait-Job

Start-Job -ScriptBlock { Install-distEdge } -InitializationScript $funcEdge
Get-Job | Wait-Job

Start-Job -ScriptBlock { Install-distAzCLI } -InitializationScript $funcAzCLI
Get-Job | Wait-Job

Start-Job -ScriptBlock { Install-distFirefox } -InitializationScript $funcFirefox
Get-Job | Wait-Job


# Module Installation
Invoke-WebRequest -uri 'https://github.com/distcode/AzMgmtVMScript/blob/master/DISTAzTools.zip?raw=true' -OutFile "$env:TEMP\DISTAzTools.zip"
Expand-Archive -Path "$env:temp\DISTAzTools.zip" -DestinationPath 'C:\Program Files\PowerShell\7\Modules'
