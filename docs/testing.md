# Testing

## Test profile wiring

`conf/test.config` defines a minimal smoke dataset (`data/reads/illumina_reads_40.fasta.gz`) and writes to `results_test/`.

## Recommended checks

```bash
make lint
```

```bash
nextflow run . -profile test,local
```

```bash
bash tests/smoke/check_outputs.sh results_test
```

## CI strategy (minimal)

- Lint Perl + Python helper scripts.
- Run a smoke workflow (`test,local`) on bundled data.
- Assert expected output artifacts exist.
