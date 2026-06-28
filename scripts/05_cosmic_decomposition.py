# Assign extracted de novo signatures to COSMIC reference signatures
from SigProfilerAssignment import Analyzer as Analyze

Analyze.cosmic_fit(
    samples="data/output/sig_extraction/SBS96/Suggested_Solution/SBS96_De-Novo_Solution/Signatures/SBS96_De-Novo_Signatures.txt",
    output="data/output/cosmic_assignment",
    input_type="matrix",
    context_type="96",
    collapse_to_SBS96=True,
    genome_build="GRCh38",
    cosmic_version=3.4,
    make_plots=True,
    verbose=True
)
