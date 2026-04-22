# Phase 1 implementation-driven audit

## A) Repository inventory

### Workflow and scripts
- `Snakefile`: original end-to-end Snakemake workflow.
- `config.yaml`: Snakemake runtime parameters.
- `scripts/match.pl`, `scripts/annotate.pl`: computational core.

### Data/examples
- `data/reads/*.fasta.gz`: four read sets (`40/60/80/100` base read lengths).
- `data/ref/hg38_partial.fasta.gz`: reference subsequence from chr1.
- `data/annotations/`: annotation files (chr1 GFF3/TSS + whole-chromosome-style CpG and repeats + extra GTF not used by workflow).

### Docs/reporting
- `docs/*.md`, `mkdocs.yml`: original docs.
- `report/*.rst`: Snakemake report captions.
- `docs/files/dag.dot`, `docs/files/dag.png`: workflow DAG artifact.

### Environment/tooling
- `environment.yml`: large conda env, used in old docs.
- No CI, tests, containers, governance metadata, or contributor policies previously.

### Inconsistencies observed
- `docs/parameters.md` uses keys (`annotations`, `results_dir`) that do not match `config.yaml` (`annotate`, `results`).
- `report/workflow.rst` mentions a `multiqc` step that does not exist in `Snakefile`.
- `data/annotations/hg38_geneannotation.gtf.gz` is present but unused by the current workflow.

## B) Current workflow architecture (Snakemake)

Actual DAG from `Snakefile`:

- `all`
  - per sample: `match` -> `annotate`
  - `merge_annotated`
  - `summarize_matches`
  - `plot_counts_and_cpg_gc`
  - `plot_tss_distance`
  - `plot_tss_type`

### Rule behavior
- `match`: invokes `perl scripts/match.pl <reads> <ref> <querysize>` and writes `{sample}.matched` (temp).
- `annotate`: invokes `perl scripts/annotate.pl` with matched file + four annotation files.
- `merge_annotated`: concatenates all sample annotation files using first header.
- `summarize_matches`: `cut/sort/uniq/awk` summary from columns 9,10,15.
- plotting rules: Python/Pandas/Matplotlib/Seaborn inline in Snakefile.

Pipeline is primarily file-driven via `glob_wildcards(config["read"])` and deterministic file naming.

## C) Data model and contracts

### Inputs
- Reads: FASTA/FASTA.GZ files matched by config glob.
- Reference: FASTA/FASTA.GZ.
- Annotation files:
  - GFF3 gene annotation (`hg38_chr1_geneannotation.gff3.gz` in default config).
  - TSS TSV (`hg38_chr1_tss.txt.gz`).
  - CpG table (`hg38_cpg.txt.gz`).
  - RepeatMasker BED-like table (`hg38_repeatmasker.bed.gz`).

### Intermediates/outputs
- Per-sample `.matched` (tab-separated; includes metadata header lines with `#` plus data table).
- Per-sample `.annotated` with columns:
  `Start End Strand MatchedSeq Occurrences Chromosome TSS_* GFF_* InCpG CpG_* Repeat_*`.
- Merged table + summary text + 4 plot files.

### Chromosome handling
- Snakemake hard-codes chr1 annotation filenames.
- `annotate.pl` originally hard-coded chromosome assignment to `chr1` for every row, regardless of input.
- Therefore current implementation is effectively chr1-only.

## D) Porting risk assessment

### Clean mappings to Nextflow processes
- `match.pl` and `annotate.pl` each map directly to one process.
- Merge/summarize/plot steps map to separate downstream processes.

### Migration risks
- Perl scripts use host commands (`lscpu`, `gunzip`) and process forking; container runtime must include these tools.
- `annotate.pl` used a shared `/tmp/perl_parallel` directory; concurrent tasks risk collisions.
- Snakemake inline plotting logic required extraction into reusable scripts/processes.
- Hard-coded column positions in summarize step are brittle to schema changes.

### Perl retention/refactor decision
- Keep both Perl scripts as core engines.
- Apply minimal refactor only where required for scalability/portability (chromosome argument + safer temp directory in `annotate.pl`).

## E) Documentation gap analysis

Observed gaps before migration:
- Parameter names in docs inconsistent with executable config.
- Conda-only setup guidance, no container/HPC profiles.
- No Nextflow usage docs.
- No explicit I/O schema table for the annotation contract.
- No contributor extension guide for multi-chromosome mode.

## F) Testing gap analysis

Before migration:
- No unit tests, smoke tests, or CI hooks.

Testable units now identified:
- Perl syntax + lightweight behavior tests.
- Workflow smoke run on bundled small data.
- Output file existence checks for core artifacts.

## G) Production-readiness assessment

Before migration, not production ready for HPC due to:
- Snakemake-only execution assumptions.
- No profile-based resource configs.
- No container definition.
- No project governance/security/release metadata.

Target state adds Nextflow profiles (`local/docker/singularity/hpc (Slurm executor)`), container-first guidance, and baseline project hygiene.
