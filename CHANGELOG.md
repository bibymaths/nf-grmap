# Changelog

## [0.2.0] - 2026-04-22

### Added
- Nextflow DSL2 implementation with modular nf-core-inspired layout.
- Multi-profile execution config (`docker`, `singularity`, `slurm`, `test`).
- Sample sheet input mode for multi-chromosome scaffolding.
- MkDocs Material documentation rewrite.
- Repository governance and metadata files.
- Basic smoke/perl checks.

### Changed
- `annotate.pl` accepts optional chromosome argument and uses safer per-run temp directory.

### Deprecated
- Snakemake as primary execution engine (retained as migration reference).
