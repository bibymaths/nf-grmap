# Inputs and outputs

## Inputs

- Read FASTA(.gz)
- Reference FASTA(.gz)
- Annotation resources (GFF3, TSS TSV, CpG table, RepeatMasker BED-like)

## Outputs

- `results/matched/*.matched`
- `results/annotated/*.annotated.tsv`
- `results/all_samples.annotated.tsv`
- `results/summary_counts.txt`
- `results/gene_counts.png`
- `results/gene_cpg_gc.png`
- `results/tss_distance.png`
- `results/tss_type.png`
- `results/pipeline_info/{trace,report,timeline,dag}`
