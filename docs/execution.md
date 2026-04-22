# Running locally and on HPC

## Local executor

```bash
nextflow run . -profile local
```

## Docker

```bash
nextflow run . -profile docker
```

## Singularity/Apptainer

```bash
nextflow run . -profile singularity
```

## HPC (Slurm executor profile)

```bash
nextflow run . -profile hpc,singularity
```

Tune per-process resources in `nextflow.config` (`withName: MATCH`, `ANNOTATE`, etc.).
