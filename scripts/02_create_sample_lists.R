library(maftools)

# Load TCGA MAF files
luad <- read.maf("data/TCGA-LUAD.maf.gz")
coad <- read.maf("data/TCGA-COAD.maf.gz")

# Extract all sample barcodes
luad_samples <- getSampleSummary(luad)$Tumor_Sample_Barcode
coad_samples <- getSampleSummary(coad)$Tumor_Sample_Barcode

# Save complete sample lists
writeLines(luad_samples, "luad_samples.txt")
writeLines(coad_samples, "coad_samples.txt")

# Keep only primary tumour samples (01A)
luad_tumor <- grep("-01A-", luad_samples, value = TRUE)
coad_tumor <- grep("-01A-", coad_samples, value = TRUE)

# Save tumour-only sample lists
writeLines(luad_tumor, "luad_tumor_samples.txt")
writeLines(coad_tumor, "coad_tumor_samples.txt")
