# GRmap

GRmap is a lightweight workflow for matching sequencing reads to a reference genome and annotating those matches with gene, TSS, CpG, and repeat metadata.

This repository now includes:

- a **legacy Snakemake implementation** (`Snakefile`) used as migration source of truth,
- a **Nextflow DSL2 implementation** (`main.nf`) with modular processes,
- docs and project governance files for maintainable open-source development.

## Current recommended engine

Use **Nextflow DSL2**.

## Quick run (default chr1 mode)

```bash
nextflow run . -profile docker
```

## Quick run (samplesheet mode for multi-chromosome-ready input)

```bash
nextflow run . -profile docker --samplesheet assets/samplesheet.csv
```

## Documentation

Full docs live in `docs/` and are built with MkDocs Material.

## License

BSD 3-Clause, see [LICENSE](LICENSE).
