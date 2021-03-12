#
# Install VSCode
#

function Install-DISTAzVSCode {
    
    if ( -not ( Test-DISTAzChocolatey ) ) {
        Write-Host 'Run Install-DISTAzChocolatey first to get chocolatey.' -ForegroundColor Cyan
        return
    }

    choco install vscode -y --force
}