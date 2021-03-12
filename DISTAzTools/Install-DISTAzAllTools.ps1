#
#
#

function Install-DISTAzAllTools {

    if ( -not ( Test-DISTAzChocolatey ) ) {
        Write-Host 'Run Install-DISTAzChocolatey first to get chocolatey.' -ForegroundColor Cyan
        return
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
