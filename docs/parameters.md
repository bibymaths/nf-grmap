# Parameters

| Parameter | Description | Default |
|---|---|---|
| `--input` | Read file glob used when no samplesheet is provided | `data/reads/*.fasta.gz` |
| `--samplesheet` | CSV with `sample,reads,chromosome,gff,tss,cpg,repeatmasker` | `null` |
| `--reference` | Reference FASTA/FASTA.GZ | `data/ref/hg38_partial.fasta.gz` |
| `--query_size` | Max query records passed to `match.pl`; `0` means all | `10` |
| `--chromosome` | Default chromosome label in non-samplesheet mode | `chr1` |
| `--annotation_dir` | Annotation directory | `data/annotations` |
| `--gff` | GFF3 path override | `${annotation_dir}/hg38_chr1_geneannotation.gff3.gz` |
| `--tss` | TSS table path override | `${annotation_dir}/hg38_chr1_tss.txt.gz` |
| `--cpg` | CpG table path override | `${annotation_dir}/hg38_cpg.txt.gz` |
| `--repeatmasker` | RepeatMasker path override | `${annotation_dir}/hg38_repeatmasker.bed.gz` |
| `--outdir` | Published output directory | `results` |
| `--publish_mode` | Nextflow publish mode | `copy` |
| `--tracedir` | Optional explicit run-metadata directory | `${outdir}/pipeline_info` |
