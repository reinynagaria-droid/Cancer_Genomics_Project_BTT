from SigProfilerMatrixGenerator.scripts import SigProfilerMatrixGeneratorFunc as matGen

def main():
    matGen.SigProfilerMatrixGeneratorFunc(
        "project",  # Project name 
        "GRCh38",  # Reference genome
        "data/", # Directory containing MAF files
        exome=False  # Whole genome style matrix generation
    )

if __name__ == "__main__":
    main()
