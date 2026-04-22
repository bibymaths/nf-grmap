# Quick start

## Prerequisites

- Nextflow `>=23.10`
- Either:
  - local runtime dependencies (Perl modules + Python plotting stack), or
  - Docker/Singularity profile for process containers.

## 1) Local profile

```bash
nextflow run . -profile local
```

## 2) Docker profile (containerized tasks)

```bash
nextflow run . -profile docker
```

## 3) Samplesheet mode (multi-chromosome-ready wiring)

```bash
nextflow run . -profile local --samplesheet assets/samplesheet.csv
```

## 4) Minimal smoke test profile

```bash
nextflow run . -profile test,local
```
