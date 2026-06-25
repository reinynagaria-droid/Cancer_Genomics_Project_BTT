library(data.table)

# Load activity matrix
act <- fread("data/output/sig_extraction/SBS96/Suggested_Solution/SBS96_De-Novo_Solution/Activities/SBS96_De-Novo_Activities_refit.txt")

# Fix column name
colnames(act)[1] <- "Sample"

# Load cohort labels
luad_ids <- readLines("luad_tumor_samples.txt")
coad_ids <- readLines("coad_tumor_samples.txt")

# Assign cohort
act$Cancer <- "Other"
act$Cancer[act$Sample %in% luad_ids] <- "LUAD"
act$Cancer[act$Sample %in% coad_ids] <- "COAD"

# Keep only LUAD and COAD
act <- act[act$Cancer %in% c("LUAD", "COAD")]

# Compute mean exposures
luad_mean <- colMeans(act[act$Cancer == "LUAD", 2:6])
coad_mean <- colMeans(act[act$Cancer == "COAD", 2:6])

# Build comparison table
comparison <- data.frame(
  Signature = names(luad_mean),
  LUAD = as.numeric(luad_mean),
  COAD = as.numeric(coad_mean)
)

# Save output
write.csv(comparison, "results/LUAD_COAD_signature_comparison.csv", row.names = FALSE)
