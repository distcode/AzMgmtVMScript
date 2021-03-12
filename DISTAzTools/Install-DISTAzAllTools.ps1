#
#
#

function Install-DISTAzAllTools {

    if ( -not (Test-Path 'C:\ProgramData\chocolatey\choco.exe') ) {
        Write-Host 'Run Install-DISTAzChocolatey first to get chocolatey.' -ForegroundColor Cyan
    }

    Install-DISTAzPowerShellCore
    Install-DISTAzAZCLI
    Install-DISTAzAzModules
    Install-DISTAzVSCode
    Install-DISTAzVSCodeExtension
    Install-DISTAzBrowsers -All
    Install-DISTAzStorageExplorer
    Install-DISTAzGit
    
}
