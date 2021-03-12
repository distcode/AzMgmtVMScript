

function Test-DISTAzChocolatey {
    if ( -not (Test-Path 'C:\ProgramData\chocolatey\choco.exe') ) {
        Write-Host 'Run Install-DISTAzChocolatey first to get chocolatey.' -ForegroundColor Cyan
        return $false
    }

    return $true
}