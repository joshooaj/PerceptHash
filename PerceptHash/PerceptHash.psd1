@{
    RootModule        = 'bin/PerceptHashLib.dll'
    ModuleVersion     = '0.1.0'
    GUID              = 'fb71747d-9d5e-47b1-be14-1c440a63ce37'
    Author            = 'joshooaj'
    CompanyName       = 'joshooaj'
    Copyright         = '(c) 2024 Joshua Hendricks. All rights reserved.'
    Description       = 'Compare images using perceptual hashes.'
    FunctionsToExport = @()
    CmdletsToExport   = @('Get-PerceptHash', 'Compare-PerceptHash')
    VariablesToExport = @()
    AliasesToExport   = @()
    PrivateData       = @{
        PSData = @{
            Tags         = @('perceptual-hash', 'dhash', 'image-comparison')
            LicenseUri   = 'https://github.com/joshooaj/PerceptHash/blob/main/LICENSE'
            ProjectUri   = 'https://github.com/joshooaj/PerceptHash'
            IconUri      = 'https://raw.githubusercontent.com/joshooaj/PerceptHash/main/docs/assets/images/joshooaj.jpg'
            ReleaseNotes = 'https://github.com/joshooaj/PerceptHash/blob/main/CHANGELOG.md'
        }
    }
}
