using System;
using System.IO;
using System.Management.Automation;
using System.Reflection;
using System.Runtime.InteropServices;

namespace PerceptHashLib
{
    public class Initializer : IModuleAssemblyInitializer
    {
        private static string _binFolder;

        [DllImport("kernel32.dll", CharSet = CharSet.Unicode, SetLastError = true)]
        [return: MarshalAs(UnmanagedType.Bool)]
        private static extern bool SetDllDirectory(string lpPathName);

        public void OnImport()
        {
            var thisAssembly = this.GetType().Assembly.Location;
            _binFolder = new FileInfo(thisAssembly).DirectoryName ?? throw new DirectoryNotFoundException($"Could not find the parent directory of {thisAssembly}.");
            if (Environment.OSVersion.Platform == PlatformID.Win32NT)
            {
                SetDllDirectory(_binFolder);
            }

            AppDomain.CurrentDomain.AssemblyResolve += RedirectToLoadedAssemblies;
        }

        private static Assembly RedirectToLoadedAssemblies(object sender, ResolveEventArgs args)
        {
            var baseName = args.Name.Split(',')[0];
            var fullName = Path.Combine(_binFolder, $"{baseName}.dll");
            if (File.Exists(fullName))
            {
                File.AppendAllText("c:\\temp\\assemblies.txt", $"Loading {fullName}");
                return Assembly.LoadFile(fullName);
            }
            File.AppendAllText("c:\\temp\\assemblies.txt", $"\"{args.Name}\",\"{args.RequestingAssembly?.FullName}\",\"{args.RequestingAssembly?.Location}\"\r\n");
            return null;
        }
    }
}
