# Cancer Genomics Project: Comparative Mutational Signature Analysis of LUAD and COAD

## Overview

This project presents a comparative mutational signature analysis of **Lung Adenocarcinoma (LUAD)** and **Colon Adenocarcinoma (COAD)** using publicly available somatic mutation data from The Cancer Genome Atlas (TCGA). The objective was to identify and compare the mutational processes underlying these two cancer types through mutational signature extraction and biological interpretation.

The analysis was performed using a combination of **R**, **Python**, and **WSL (Ubuntu)**. Somatic mutation data were explored using **maftools**, mutation count matrices were generated using **SigProfilerMatrixGenerator**, de novo mutational signatures were extracted using **SigProfilerExtractor**, and the resulting signatures were compared between cancer types before being assigned to known COSMIC mutational signatures for biological interpretation.

---

## Objectives

* Explore the mutation landscape of LUAD and COAD using TCGA MAF files.
* Generate SBS96 mutational matrices.
* Extract de novo mutational signatures using Non-negative Matrix Factorization (NMF).
* Compare mutational signature activities between LUAD and COAD.
* Interpret the biological significance of the observed mutational processes.

---

## Dataset

**Source:** TCGA (The Cancer Genome Atlas)

**Input format:** Masked Somatic Mutation Annotation Format (MAF)

**Cancer Types**

* Lung Adenocarcinoma (LUAD)
* Colon Adenocarcinoma (COAD)

**Reference Genome**

* GRCh38

The analysis was performed directly on TCGA processed MAF files. Raw sequencing data processing, alignment, and variant calling were outside the scope of this project.

---

## Software and Tools

| Tool                       | Purpose                                |
| -------------------------- | -------------------------------------- |
| R                          | Statistical analysis and visualization |
| maftools                   | MAF exploration and mutation summaries |
| ggplot2                    | Comparative plotting                   |
| Python                     | Signature analysis workflow            |
| SigProfilerMatrixGenerator | SBS matrix generation                  |
| SigProfilerExtractor       | De novo signature extraction           |
| Ubuntu (WSL)               | Runtime environment                    |
| Git & GitHub               | Version control                        |

---

## Project Workflow

### 1. Mutation Exploration

* Loaded LUAD and COAD MAF files into R.
* Explored mutation burden.
* Generated mutation summaries.
* Created oncoplots for both cohorts.

### 2. Mutation Matrix Generation

SigProfilerMatrixGenerator was used to convert the MAF files into SBS96 trinucleotide mutation count matrices required for downstream mutational signature analysis.

### 3. De Novo Signature Extraction

SigProfilerExtractor was applied to the SBS96 matrices using Non-negative Matrix Factorization (NMF). Multiple candidate solutions were generated before selecting the optimal five-signature solution based on reconstruction quality and stability.

### 4. Signature Comparison

The activities of the extracted signatures were compared across LUAD and COAD samples to identify cancer-specific mutational processes.

### 5. Biological Interpretation

The extracted signatures were manually assigned to known COSMIC SBS signatures based on their mutational characteristics and biological relevance, allowing interpretation of the dominant mutational processes in each cancer type.
```

---

## Key Results

The extracted signatures showed clear biological differences between LUAD and COAD.

| De Novo Signature | Assigned COSMIC Signature | LUAD Activity | COAD Activity |
| ----------------- | ------------------------- | ------------: | ------------: |
| SBS96A            | SBS4                      |        217.75 |         20.70 |
| SBS96B            | SBS1                      |         11.32 |        152.35 |
| SBS96C            | SBS10b                    |          7.61 |        132.64 |
| SBS96D            | SBS44                     |         19.94 |        107.17 |
| SBS96E            | SBS2                      |         56.89 |         10.71 |

---

## Biological Interpretation

### LUAD

Lung adenocarcinoma was dominated by **SBS4**, a mutational signature associated with tobacco smoke exposure. This reflects the strong influence of environmental carcinogens on lung tissue. LUAD also showed elevated activity of **SBS2**, representing APOBEC-mediated mutagenesis, suggesting increased endogenous DNA editing activity.

### COAD

Colon adenocarcinoma exhibited substantially higher activities of **SBS1**, **SBS10b**, and **SBS44**.

* **SBS1** represents spontaneous age-related deamination of methylated cytosines.
* **SBS10b** is associated with defective POLE proofreading during DNA replication.
* **SBS44** reflects DNA mismatch repair deficiency and microsatellite instability.

Together, these signatures indicate that COAD mutagenesis is primarily driven by endogenous DNA replication and repair defects rather than environmental exposure.



## Major Findings

* LUAD demonstrated a strong tobacco-associated mutational profile.
* COAD was dominated by replication-associated and DNA repair-related signatures.
* Environmental mutagenesis played a larger role in LUAD.
* Endogenous mutational mechanisms were the primary contributors in COAD.
* Comparative signature analysis successfully distinguished the characteristic mutational landscapes of the two cancer types.



## Reproducing the Analysis

1. Download TCGA LUAD and COAD MAF files.
2. Generate mutation summaries using the R scripts.
3. Create SBS96 mutation matrices using SigProfilerMatrixGenerator.
4. Run SigProfilerExtractor for de novo signature extraction.
5. Compare signature activities using the provided R scripts.
6. Interpret the extracted signatures using the COSMIC SBS reference.



## Repository Note

Large intermediate files generated by SigProfiler, mutation matrices, and output directories are intentionally excluded from this repository to keep the project lightweight. Running the analysis pipeline with the provided scripts will regenerate these outputs.



## Author

**Reiny Nagaria**

Cancer Genomics Project

June 2026
