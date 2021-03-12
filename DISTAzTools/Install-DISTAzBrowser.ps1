#
# Install Browsers
#

function Install-DISTAzBrowsers {
    [CmdletBinding()]
    param (
        [Parameter(ParameterSetName='Default')]
        [Switch]
        $Chrome,

        [Parameter(ParameterSetName='Default')]
        [Switch]
        $Edge,

        [Parameter(ParameterSetName='Default')]
        [Switch]
        $Firefox,

        [Parameter(ParameterSetName='All')]
        [Switch]
        $All
    )
    
    if ( -not (Test-Path 'C:\ProgramData\chocolatey\choco.exe') ) {
        Write-Host 'Run Install-DISTAzChocolatey first to get chocolatey.' -ForegroundColor Cyan
    }

    if ( $All ) {
        $Chrome = $true
        $Edge = $true
        $Firefox = $true
    }

    if ( $Chrome ) {
        choco install googlechrome -y
    }

    if ( $Edge ) {
        choco install microsoft-edge -y
    }

    if ( $Firefox ) {
        choco install firefox -y
    }
}