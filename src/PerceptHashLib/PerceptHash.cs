namespace PerceptHashLib
{
    public class PerceptHash
    {
        public PerceptHashAlgorithm Algorithm { get; }
        public string Hash { get; }
        public string Path { get; }

        internal byte[] hash;

        public PerceptHash(PerceptHashAlgorithm algorithm, byte[] hash, string path) {
            Algorithm = algorithm;
            Hash = hash.ToHex();
            Path = path;
            this.hash = hash;
        }
    }
}
