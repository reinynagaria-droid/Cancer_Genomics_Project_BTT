from SigProfilerMatrixGenerator.scripts import SigProfilerMatrixGeneratorFunc as matGen

def main():
    matGen.SigProfilerMatrixGeneratorFunc(
        "project",
        "GRCh38",
        "data/",
        exome=False
    )

if __name__ == "__main__":
    main()
