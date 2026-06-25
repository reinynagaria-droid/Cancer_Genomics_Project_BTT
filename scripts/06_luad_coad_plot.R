library(data.table)

# Load comparison table
df <- fread("results/LUAD_COAD_signature_comparison.csv")

# Convert to long format for plotting
df_long <- melt(df, id.vars = "Signature",
                variable.name = "Cancer",
                value.name = "Exposure")

# Create bar plot
pdf("results/LUAD_COAD_comparative_plot.pdf", width = 8, height = 5)

barplot(
  height = t(as.matrix(df[, -1])),
  beside = TRUE,
  names.arg = df$Signature,
  col = c("steelblue", "firebrick"),
  legend.text = c("LUAD", "COAD"),
  args.legend = list(x = "topright"),
  main = "LUAD vs COAD Mutational Signature Comparison",
  ylab = "Mean Signature Exposure",
  las = 2
)

dev.off()
