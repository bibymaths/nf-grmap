# Smoke tests

Run a minimal pipeline execution:

```bash
nextflow run . -profile test,local
```

Validate expected artifacts:

```bash
bash tests/smoke/check_outputs.sh results_test
```
