using System;
using System.Management.Automation;

namespace PerceptHashLib
{
    [Cmdlet(VerbsData.Compare, nameof(PerceptHash))]
    [OutputType(typeof(int))]
    public class ComparePerceptHashCommand : PSCmdlet
    {
        [Parameter(Position = 0, ValueFromPipeline = true)]
        [PerceptHashTransform()]
        public object ReferenceHash { get; set; }

        [Parameter(Position = 1)]
        [PerceptHashTransform()]
        public object DifferenceHash { get; set; }

        protected override void ProcessRecord()
        {
            var reference = ReferenceHash as byte[];
            var difference = DifferenceHash as byte[];
            if (reference.Length != difference.Length)
            {
                throw new ArgumentException($"{nameof(ReferenceHash)} and {nameof(DifferenceHash)} must have matching lengths.");
            }
            var hashDifference = 0;
            for (int i = 0; i < reference.Length; i++)
            {
                var xor = reference[i] ^ difference[i];
                for (int bit = 8; bit > 0; bit--)
                {
                    hashDifference += xor & 1;
                    xor = xor >> 1;
                }
            }
            WriteObject(hashDifference);
        }
    }
}
