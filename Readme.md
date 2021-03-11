# Scripts for Azure Demonstrations

This repo contains scripts which are used as custom script extension for Azure VMs.

## Scripts

**AzMgmtVMSetup.ps1**

This script installs several adminstration tools and a PS7 module in an Azure VM. The admin tools are the following:
1. PowerShell 7
2. Azure PowerShell Modules
3. Azure CLI
4. Storage Explorer
5. Visual Studio Code
6. Google Chrome
7. Microsoft Edge
8. Mozilla Firefox
9. git

Most of them are installed via Chocolatey, which remains on VM after running the script. For additional information about the module read further below.

## Modules

**Module DISTAzTools**

This module contains the following functions:
+ *Install-DISTAzVSCodeExtension:* This functions installs the VS Code extensions Powershell, Azure Resource Manager Tools, Azure CLI. Additional Extensions could be installed by parameter.
+ *Get-DISTAzVMPubIP:* This functions gets the public IP of an Azure VM. The required parameters are ResourceGroup and VMName. You could also use pipeline.

These files are as they are without any support by the developer.