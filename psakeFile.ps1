properties {
    $Configuration = 'Release'

    # Set this to $true to create a module with a monolithic PSM1
    $PSBPreference.Build.CompileModule = $false
    $PSBPreference.Help.DefaultLocale = 'en-US'
    $PSBPreference.Test.OutputFile = 'out/testResults.xml'
    $PSBPreference.Docs.RootDir = './docs/commands'

    $psake.context.tasks.stagefiles.PostAction = {
        $outputManifestPath = [io.path]::Combine($PSBPreference.Build.ModuleOutDir, "$($PSBPreference.General.ModuleName).psd1")
        Update-Metadata -Path $outputManifestPath -PropertyName ModuleVersion -Value $PSBPreference.General.ModuleVersion
    }
}

task Default -depends Compile, UpdateVersion, StageLibrary, Test

task Test -FromModule PowerShellBuild -minimumVersion '0.6.1'

task DotnetToolRestore {
    Exec {
        dotnet tool restore
    }
}

task Compile -depends DotnetToolRestore {
    foreach ($project in Get-ChildItem -Path (Join-Path $psake.build_script_dir '\src\*.csproj') -Recurse) {
        Exec {
            $outputPath = Join-Path $PSBPreference.Build.OutDir "/lib/$($project.BaseName)"
            dotnet restore "`"$($project.FullName)`""
            dotnet build "`"$($project.FullName)`"" -o "`"$outputPath`""
        }
    }
}

task UpdateVersion {
    $script:PSBPreference.General.ModuleVersion = (dotnet nbgv get-version -f json | ConvertFrom-Json).SimpleVersion
}

task StageLibrary {
    $sdkSrc = Join-Path $PSBPreference.Build.OutDir '\lib\PerceptHashLib'
    $sdkDst = Join-Path $PSBPreference.General.SrcRootDir 'bin'
    $null = New-Item -Path $sdkDst -ItemType Directory -Force -Verbose

    Get-ChildItem -Path $sdkSrc | Copy-Item -Destination $sdkDst -Recurse
}
