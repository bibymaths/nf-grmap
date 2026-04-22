# Installation

## Required

- Nextflow `>=23.10`

## Runtime options

### Option 1: local runtime dependencies
Install Perl dependencies used by `scripts/annotate.pl` plus Python plotting dependencies.

### Option 2: containerized task execution (recommended)
Use Docker or Singularity profiles so each Nextflow process runs in the pipeline container.

## Build container image locally

```bash
docker build -t grmap:dev .
```

Then run with:

```bash
nextflow run . -profile docker
```
