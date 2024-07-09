@{
    PSDepend = @{
        Version = '0.3.8'
    }
    PSDependOptions = @{
        Target = 'CurrentUser'
    }
    'Pester' = @{
        Version = '5.6.1'
        Parameters = @{
            SkipPublisherCheck = $true
        }
    }
    'psake' = @{
        Version = '4.9.0'
    }
    'BuildHelpers' = @{
        Version = '2.0.16'
    }
    'joshooaj.PowerShellBuild' = @{
        Version = '0.6.3'
    }
    'joshooaj.platyPS' = @{
        Version = '0.15.12'
    }
    'PSScriptAnalyzer' = @{
        Version = '1.22.0'
    }
}
