# GRmap overview

GRmap performs two core operations:

1. `scripts/match.pl` — exact read matching against a reference FASTA.
2. `scripts/annotate.pl` — annotation of matched coordinates with GFF3, TSS, CpG, and RepeatMasker data.

The maintained implementation is a Nextflow DSL2 pipeline that wraps these scripts in modular processes and supports local, Docker, Singularity, and HPC (Slurm) execution profiles.

!!! note
    The migration and current architecture are implementation-driven from the repository's original Snakemake workflow and script behavior.
