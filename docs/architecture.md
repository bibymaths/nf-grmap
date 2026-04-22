# Phase 2 migration architecture

## Workflow graph

`GRMAP_CORE` subworkflow:

- `MATCH`
- `ANNOTATE`

Downstream workflow:

- `MERGE_ANNOTATED`
- `SUMMARIZE_MATCHES`
- `PLOT_COUNTS_AND_CPG_GC`
- `PLOT_TSS_DISTANCE`
- `PLOT_TSS_TYPE`

## Design choices

- Keep Perl scripts as computational core.
- Use metadata map (`meta`) through channels with `sample`, `chromosome`, and annotation file paths.
- Support two input modes:
  - `--input` glob (legacy-compatible defaults, chr1).
  - `--samplesheet` CSV (multi-chromosome-ready, explicit file mapping).

## Repository layout

- `main.nf`, `nextflow.config`, `nextflow_schema.json`
- `conf/` profile and default parameter composition
- `modules/local/` process modules
- `subworkflows/local/` orchestration
- `workflows/` entry workflow
- `assets/samplesheet.csv` example
- `tests/` smoke + perl checks
- `docs/` MkDocs Material documentation
