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
    
    if ( -not ( Test-DISTAzChocolatey ) ) {
        Write-Host 'Run Install-DISTAzChocolatey first to get chocolatey.' -ForegroundColor Cyan
        return
    }

    if ( $All ) {
        $Chrome = $true
        $Edge = $true
        $Firefox = $true
    }

    if ( $Chrome ) {
        choco install googlechrome -y --force
    }

    if ( $Edge ) {
        choco install microsoft-edge -y --force
    }

    if ( $Firefox ) {
        choco install firefox -y --force
    }
}