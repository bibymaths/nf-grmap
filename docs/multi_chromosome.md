# Multi-chromosome extension guide

## Where chr1 was hard-coded historically

- Snakemake `annotate` rule used fixed chr1 filenames.
- `scripts/annotate.pl` assigned `chr1` internally for all matches.

## What changed

- `annotate.pl` now accepts optional chromosome argument (`[chromosome]`, default `chr1`).
- Nextflow metadata map carries `chromosome`, `gff`, `tss`, `cpg`, `repeatmasker` per sample row.

## Recommended scaling pattern

Use `--samplesheet` with one row per `(sample, chromosome annotation set)`.

```csv
sample,reads,chromosome,gff,tss,cpg,repeatmasker
sampleA_chr1,reads_A.fasta.gz,chr1,chr1.gff3.gz,chr1_tss.txt.gz,cpg.txt.gz,repeatmasker.bed.gz
sampleA_chr2,reads_A.fasta.gz,chr2,chr2.gff3.gz,chr2_tss.txt.gz,cpg.txt.gz,repeatmasker.bed.gz
```

This pattern propagates chromosome metadata in channels and keeps output naming sample-scoped.

## Future enhancement path

If match coordinates become multi-chromosome aware, pass chromosome directly from matcher output instead of fixed per-row metadata.
