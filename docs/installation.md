# Installation

## Runtime prerequisites

- Nextflow (>= 23.10)
- One runtime profile:
  - Docker (recommended), or
  - Singularity/Apptainer, or
  - Local environment with Perl + Python scientific stack

## Container-first recommendation

Build image:

```bash
docker build -t grmap:dev .
```

Run with Docker profile:

```bash
nextflow run . -profile docker
```
