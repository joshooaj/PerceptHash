using PerceptHashLib.Algorithms;
using System;
using System.IO;
using System.Management.Automation;

namespace PerceptHashLib
{

    [Cmdlet(VerbsCommon.Get, nameof(PerceptHash), DefaultParameterSetName = nameof(Path))]
    [OutputType(typeof(string))]
    public class GetPerceptHashCommand : PSCmdlet
    {
        [Parameter(Mandatory = true, Position = 0, ParameterSetName = nameof(Path), ValueFromPipeline = true, ValueFromPipelineByPropertyName = true)]
        public string[] Path { get; set; }

        [Parameter(Mandatory = true, Position = 0, ParameterSetName = nameof(LiteralPath), ValueFromPipelineByPropertyName = true)]
        public string[] LiteralPath { get; set; }

        [Parameter(Mandatory = true, Position = 0, ParameterSetName = nameof(InputStream))]
        public Stream InputStream { get; set; }

        [Parameter()]
        public PerceptHashAlgorithm Algorithm { get; set; } = PerceptHashAlgorithm.dhash;

        protected override void ProcessRecord()
        {
            switch (ParameterSetName)
            {
                case nameof(Path):
                    ProviderInfo pathProvider;
                    foreach (var unresolvedPath in Path)
                    {
                        var resolvedPaths = GetResolvedProviderPathFromPSPath(unresolvedPath, out pathProvider);
                        foreach (var resolvedPath in resolvedPaths)
                        {
                            ProcessFile(resolvedPath);
                        }
                    }
                    break;
                
                case nameof(LiteralPath):
                    foreach (var path in LiteralPath) {
                        ProcessFile(path);
                    }
                    break;
                
                case nameof(InputStream):
                    ProcessStream(InputStream);
                    break;
                
                default:
                    throw new InvalidOperationException($"Support for parameter set \"{ParameterSetName}\" not implemented.");
            }
        }

        private void ProcessFile(string filePath)
        {
            filePath = System.IO.Path.GetFullPath(filePath);
            using (var stream = File.Open(filePath, FileMode.Open, FileAccess.Read, FileShare.Read))
            {
                ProcessStream(stream, filePath);
            }
        }

        private void ProcessStream(Stream stream, string filePath = "")
        {
            switch (Algorithm)
            {
                case PerceptHashAlgorithm.dhash:
                    WriteObject(new PerceptHash(Algorithm, DHashAlgorithm.CalculateHash(stream), filePath));
                    break;

                default:
                    throw new InvalidOperationException($"Algorithm \"{Algorithm}\" not implemented.");
            }
        }
    }
}
