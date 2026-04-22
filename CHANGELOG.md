# Changelog

## [0.2.1] - 2026-04-22

### Fixed
- Aligned Nextflow parameter naming (`query_size`) across config, schema, workflow modules, and docs.
- Added explicit `local` and `hpc` profiles; removed redundant conda profile.
- Added input validation (`ifEmpty`) and samplesheet/read-path existence checks in workflow channel creation.
- Made merge step deterministic by sorting input annotation files before concatenation.
- Bound Perl script internal parallelism to `task.cpus` via `GRMAP_CORES` and added robust CPU-count fallback.

### Added
- Smoke-output assertion script: `tests/smoke/check_outputs.sh`.

### Changed
- Hardened Dockerfile to use distro Perl packages instead of CPAN-at-build.
- Removed `docker-compose.yml` (not used for standard Nextflow execution).

## [0.2.0] - 2026-04-22

### Added
- Nextflow DSL2 implementation with modular nf-core-inspired layout.
- Multi-profile execution config (`docker`, `singularity`, `hpc`, `test`).
- Sample sheet input mode for multi-chromosome scaffolding.
- MkDocs Material documentation rewrite.
- Repository governance and metadata files.
- Basic smoke/perl checks.

### Changed
- `annotate.pl` accepts optional chromosome argument and uses safer per-run temp directory.

### Deprecated
- Snakemake as primary execution engine (retained as migration reference).
