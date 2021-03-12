#
#
#

function Install-DISTAzAzModules {
    
    if ( -not ( Test-DISTAzChocolatey ) ) {
        Write-Host 'Run Install-DISTAzChocolatey first to get chocolatey.' -ForegroundColor Cyan
        return
    }

    choco install az.powershell -y --force
}