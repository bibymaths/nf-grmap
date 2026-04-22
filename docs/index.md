# GRmap overview

GRmap performs two computational core operations using Perl scripts:

1. `scripts/match.pl`: exact read sequence matching against a reference FASTA.
2. `scripts/annotate.pl`: genomic annotation of match coordinates with GFF3, TSS, CpG, and RepeatMasker data.

The Nextflow DSL2 pipeline wraps these scripts and reproduces the original Snakemake logic while adding profile-based execution, better structure, and extension points.

!!! note
    The migration design and implementation are derived directly from the legacy `Snakefile`, Perl scripts, and bundled example data.
