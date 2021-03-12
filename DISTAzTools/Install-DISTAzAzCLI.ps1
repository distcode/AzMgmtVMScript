#
# Install Azure CLI
#

function Install-DISTAzAzCLI {

    if ( -not ( Test-DISTAzChocolatey ) ) {
        Write-Host 'Run Install-DISTAzChocolatey first to get chocolatey.' -ForegroundColor Cyan
        return
    }

    choco install azure-cli -y --force
}