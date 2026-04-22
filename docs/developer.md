# Developer guide

- Keep Perl scripts as computational core unless behavior defects require changes.
- Add new processes under `modules/local/` and wire in subworkflows/workflows.
- Keep parameter definitions synchronized between `nextflow.config`, `nextflow_schema.json`, and docs.
- Run `perlcritic` and `perltidy` using repository config files when available.
