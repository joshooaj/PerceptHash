using System;
using System.Linq;
using System.Management.Automation;

namespace PerceptHashLib
{
    public class PerceptHashTransformAttribute : ArgumentTransformationAttribute
    {
        public override object Transform(EngineIntrinsics engineIntrinsics, object inputData)
        {
            switch (inputData)
            {
                case string hexString:
                    return Enumerable.Range(0, hexString.Length).Where(x => x % 2 == 0).Select(x => Convert.ToByte(hexString.Substring(x, 2), 16)).ToArray();
                case byte[] bytes:
                    return bytes;
                case PerceptHash perceptHash1:
                    return perceptHash1.hash;
                case PSObject psObject:
                    if (psObject.BaseObject is PerceptHash perceptHash2)
                    {
                        return perceptHash2.hash;
                    }
                    break;
            }

            throw new ArgumentException($"Invalid argument type \"{inputData.GetType().Name}\". Expected argument of type PerceptHash, string, or byte[].");
        }
    }
}
