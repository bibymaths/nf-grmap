# Inputs and outputs

## Inputs

### Mode A: glob input mode
- Reads from `--input` glob (default: `data/reads/*.fasta.gz`)
- Shared annotation defaults from `--annotation_dir`/override params

### Mode B: samplesheet mode
CSV columns:

```text
sample,reads,chromosome,gff,tss,cpg,repeatmasker
```

Each row defines one processing unit with explicit chromosome/annotation mapping.

## Outputs

- `results/matched/*.matched`
- `results/annotated/*.annotated.tsv`
- `results/all_samples.annotated.tsv`
- `results/summary_counts.txt`
- `results/gene_counts.png`
- `results/gene_cpg_gc.png`
- `results/tss_distance.png`
- `results/tss_type.png`
- `results/pipeline_info/{trace,report,timeline,dag}` (or `--tracedir` override)
