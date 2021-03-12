#
# Install Storage Explorer
#

function Install-DISTAzStorageExplorer {
    
    if ( -not ( Test-DISTAzChocolatey ) ) {
        Write-Host 'Run Install-DISTAzChocolatey first to get chocolatey.' -ForegroundColor Cyan
        return
    }

    choco install microsoftazurestorageexplorer -y --force
}