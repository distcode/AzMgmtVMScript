#
# PowerShell 7 installation
#

function Install-DISTAzPowerShell {
    
    if ( -not ( Test-DISTAzChocolatey ) ) {
        Write-Host 'Run Install-DISTAzChocolatey first to get chocolatey.' -ForegroundColor Cyan
        return
    }

    choco install powershell-core --install-arguments='"ADD_EXPLORER_CONTEXT_MENU_OPENPOWERSHELL=1 REGISTER_MANIFEST=1 ENABLE_PSREMOTING=1"' -y --force
    
}