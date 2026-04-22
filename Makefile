.PHONY: lint test smoke docs

lint:
	perl -c scripts/match.pl
	perl -c scripts/annotate.pl
	python -m py_compile bin/plot_counts_and_cpg_gc.py bin/plot_tss_distance.py bin/plot_tss_type.py

test:
	bash tests/perl/run_perl_checks.sh

smoke:
	nextflow run . -profile test

docs:
	mkdocs build
