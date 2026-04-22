# Quick start

## 1) Default chr1 mode (legacy-compatible)

```bash
nextflow run . -profile docker
```

## 2) Explicit sample + chromosome metadata mode

```bash
nextflow run . -profile docker --samplesheet assets/samplesheet.csv
```

## 3) Test profile

```bash
nextflow run . -profile test,docker
```
