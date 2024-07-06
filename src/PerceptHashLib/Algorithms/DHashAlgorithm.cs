using SixLabors.ImageSharp;
using SixLabors.ImageSharp.PixelFormats;
using System.IO;

namespace PerceptHashLib.Algorithms
{
    public class DHashAlgorithm
    {
        public static byte[] CalculateHash(Stream stream)
        {
            var width = 9;
            var height = 8;
            var hash = new byte[8];
            var img = Image.Load<Rgb24>(stream).ResizeImage(width, height).ConvertToGrayscale();
            img.ProcessPixelRows(accessor =>
            {
                for (int y = 0; y < height; y++)
                {
                    var row = accessor.GetRowSpan(y);
                    byte hashRow = 0;
                    for (int x = 0; x < width - 1; x++)
                    {
                        hashRow = (byte)(hashRow << 1);
                        hashRow = (byte)(hashRow | (row[x].GetBrightness() > row[x + 1].GetBrightness() ? 1 : 0));
                    }
                    hash[y] = hashRow;
                }
            });

            return hash;
        }
    }
}
