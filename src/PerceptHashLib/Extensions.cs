using SixLabors.ImageSharp;
using SixLabors.ImageSharp.PixelFormats;
using SixLabors.ImageSharp.Processing;
using SixLabors.ImageSharp.Processing.Processors.Transforms;
using System;

namespace PerceptHashLib
{
    public static class ImageExtensions
    {
        public static Image<Rgb24> ResizeImage(this Image<Rgb24> image, int width, int height)
        {
            image.Mutate(x => {
                var opt = new ResizeOptions
                {
                    Sampler = new BicubicResampler(),
                    Mode = ResizeMode.Stretch,
                    Size = new Size(width, height)
                };
                x.Resize(opt);
            });
            return image;
        }

        public static Image<Rgb24> ConvertToGrayscale(this Image<Rgb24> image)
        {
            image.Mutate(x => x.Grayscale());
            return image;
        }

        public static float GetBrightness(this Rgb24 pixel)
        {
            return (pixel.R + pixel.G + pixel.B) / 3f;
        }
    }

    public static class ByteArrayExtensions
    {
        public static string ToHex(this byte[] bytes)
        {
            return BitConverter.ToString(bytes).Replace("-", string.Empty);
        }
    }
}
