# Running locally and on HPC

## Local

```bash
nextflow run . -profile docker
```

## Singularity/Apptainer

```bash
nextflow run . -profile singularity
```

## Slurm cluster

```bash
nextflow run . -profile slurm,singularity
```

Tune resources in `nextflow.config` per process label/withName.
