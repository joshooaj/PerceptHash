# $modulePath = Join-Path $env:BHBuildOutput "$($env:BHProjectName).psd1"
# Import-Module $modulePath

Context 'Compare-PerceptHash' {
    BeforeDiscovery {
        $script:images = @(
            @{
                Name           = 'Landscape vs vivid landscape'
                Algorithm      = 'dhash'
                ReferenceHash  = '40600030F8BD397C'
                DifferenceHash = 'E0E0C0B0F8BD397C'
                Expected       = 6
            },
            @{
                Name           = 'Ben vs Cinder'
                Algorithm      = 'dhash'
                ReferenceHash  = '9CDCF8CC6C37762E'
                DifferenceHash = '8C8878D1ABC6EC7E'
                Expected       = 25
            }
        )
    }

    BeforeAll {
        $script:hashes = @(
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

    It 'Comparison of <name> is <expected>' -ForEach $script:images {
        Compare-PerceptHash $_.ReferenceHash $_.DifferenceHash | Should -Be $_.Expected
    }

    It 'Accepts ReferenceHash from pipeline' {
        $hash1 = Get-PerceptHash -Path $script:hashes[0].Path
        $hash2 = Get-PerceptHash -Path $script:hashes[1].Path
        $hash1 | Compare-PerceptHash -DifferenceHash $hash2 | Should -Be 6
    }

    It 'Accepts hashes as [PerceptHash]' {
        $hash1 = Get-PerceptHash -Path $script:hashes[0].Path
        $hash2 = Get-PerceptHash -Path $script:hashes[1].Path
        Compare-PerceptHash -ReferenceHash $hash1 -DifferenceHash $hash2 | Should -Be 6
    }

    It 'Accepts hashes as [string]' {
        Compare-PerceptHash 40600030F8BD397C E0E0C0B0F8BD397C | Should -Be 6
    }

    It 'Accepts hashes as [byte[]]' {
        $hash1 = '40600030F8BD397C'
        $hash2 = 'E0E0C0B0F8BD397C'
        [byte[]]$bytes1 = 0..($hash1.Length - 1) | Where-Object { $_ % 2 -eq 0 } | ForEach-Object {
            [convert]::ToByte($hash1.Substring($_, 2), 16)
        }
        [byte[]]$bytes2 = 0..($hash2.Length - 1) | Where-Object { $_ % 2 -eq 0 } | ForEach-Object {
            [convert]::ToByte($hash2.Substring($_, 2), 16)
        }
        Compare-PerceptHash $bytes1 $bytes2 | Should -Be 6
    }

    It 'Accepts hashes as [object[]]' {
        $hash1 = '40600030F8BD397C'
        $hash2 = 'E0E0C0B0F8BD397C'
        $bytes1 = 0..($hash1.Length - 1) | Where-Object { $_ % 2 -eq 0 } | ForEach-Object {
            [convert]::ToByte($hash1.Substring($_, 2), 16)
        }
        $bytes2 = 0..($hash2.Length - 1) | Where-Object { $_ % 2 -eq 0 } | ForEach-Object {
            [convert]::ToByte($hash2.Substring($_, 2), 16)
        }
        Compare-PerceptHash $bytes1 $bytes2 | Should -Be 6
    }
}
