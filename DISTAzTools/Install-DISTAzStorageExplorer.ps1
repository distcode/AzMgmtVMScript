#
# Install Storage Explorer
#

function Install-DISTAzStorageExplorer {
    if ( -not (Test-Path 'C:\ProgramData\chocolatey\choco.exe') ) {
        Write-Host 'Run Install-DISTAzChocolatey first to get chocolatey.' -ForegroundColor Cyan
    }

    choco install microsoftazurestorageexplorer -y
}