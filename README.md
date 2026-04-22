# GRmap

GRmap is a lightweight workflow for matching sequencing reads to a reference genome and annotating those matches with gene, TSS, CpG, and repeat metadata.

The repository contains:

- the legacy Snakemake implementation (`Snakefile`) retained as migration reference,
- the maintained Nextflow DSL2 implementation (`main.nf`),
- documentation and project metadata for maintainable open-source use.

## Recommended workflow engine

Use **Nextflow DSL2**.

## Quick start

```bash
nextflow run . -profile local
```

With containerized process execution:

```bash
nextflow run . -profile docker
```

With explicit per-row chromosome metadata:

```bash
nextflow run . -profile local --samplesheet assets/samplesheet.csv
```

## Documentation

See `docs/` (MkDocs Material).

## License

BSD 3-Clause, see [LICENSE](LICENSE).
