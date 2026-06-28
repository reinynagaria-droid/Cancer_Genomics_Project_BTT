# Cancer Genomics Project
# Step 1: Load TCGA mutation datasets

library(maftools)

# Load LUAD and COAD MAF files

luad <- read.maf("data/TCGA-LUAD.maf.gz")

coad <- read.maf("data/TCGA-COAD.maf.gz")

#basic cohort summaries
luad_summary <-  getSampleSummary(luad)
coad_summary <-  getSampleSummary(coad)

print(head(luad_summary))
print(head(coad_summary))
 
# Gene summaries
luad_genes <- getGeneSummary(luad)
coad_genes <- getGeneSummary(coad)

print(head(luad_genes))
print(head(coad_genes))

# view top mutated genes 

#mutation summary plot - LUAD 
pdf("figures/LUAD_mutation_summary.pdf")
plotmafSummary(maf = luad) 
dev.off() 

# Mutation summary plot - COAD

pdf("figures/COAD_mutation_summary.pdf")
plotmafSummary(maf = coad)
dev.off()

# generate LUAD oncoplot
pdf("figures/LUAD_oncoplot.pdf")
oncoplot(
          maf = luad,
         top = 10 
)
dev.off()

# generate COAD oncoplot 
pdf("figures/COAD_oncoplot.pdf")
oncoplot(
        maf = coad,
       top = 10
)
dev.off()

#top mutated genes
geneSummary <- getGeneSummary(luad)
print(head(geneSummary)) 

#comparing LUAD and COAD mutation frequencies
comparison <- mafCompare(
       m1 = luad,
       m2 = coad, 
     m1Name = "LUAD",
      m2Name = "COAD"
)
     
print(comparison) 










