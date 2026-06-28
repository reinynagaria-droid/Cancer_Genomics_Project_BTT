# Extract de novo mutational signatures from the SBS96 matrix
from SigProfilerExtractor import sigpro as sig

def main():
    sig.sigProfilerExtractor(
        "matrix",
        "data/output/sig_extraction",
        "data/output/SBS/project.SBS96.all",
        reference_genome="GRCh38",
        minimum_signatures=2,
        maximum_signatures=8,
        nmf_replicates=20,
    )

if __name__ == "__main__":
    main()

