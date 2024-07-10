Context 'Get-PerceptHash' {

    BeforeDiscovery {
        $script:images = @(
            @{
                Name      = 'landscape1'
                Algorithm = 'dhash'
                Hash      = '40600030F8BD397C'
                Path      = Join-Path $env:BHProjectPath 'tests/images/landscape1.jpg'
            },
            @{
                Name      = 'landscape1-vivid'
                Algorithm = 'dhash'
                Hash      = 'E0E0C0B0F8BD397C'
                Path      = Join-Path $env:BHProjectPath 'tests/images/landscape1-vivid.jpg'
            },
            @{
                Name      = 'ben'
                Algorithm = 'dhash'
                Hash      = '9CDCF8CC6C37762E'
                Path      = Join-Path $env:BHProjectPath 'tests/images/ben.jpg'
            },
            @{
                Name      = 'cinder'
                Algorithm = 'dhash'
                Hash      = '8C8878D1ABC6EC7E'
                Path      = Join-Path $env:BHProjectPath 'tests/images/cinder.jpg'
            }
        )
    }

    It 'Hash of <name> is <hash>' -ForEach $script:images {
        (Get-PerceptHash -LiteralPath $_.Path).Hash | Should -BeExactly $_.Hash
    }

    It 'Accepts pipeline input from Get-ChildItem' {
        $hashes = Get-ChildItem $PSScriptRoot/images/*.jpg | Get-PerceptHash -ErrorAction Stop
        $hashes.Count | Should -Be 4
    }
}
