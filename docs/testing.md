# Testing

## Lightweight checks

- Perl syntax checks.
- Python syntax checks.
- Nextflow config/schema parse checks.

## Smoke test

Use bundled input with test profile:

```bash
nextflow run . -profile test,docker
```

## Perl-focused tests

Run:

```bash
bash tests/perl/run_perl_checks.sh
```
