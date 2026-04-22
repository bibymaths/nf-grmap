.PHONY: lint test smoke smoke-check docs

lint:
	perl -c scripts/match.pl
	perl -c scripts/annotate.pl
	python -m py_compile bin/plot_counts_and_cpg_gc.py bin/plot_tss_distance.py bin/plot_tss_type.py
	python -m json.tool nextflow_schema.json > /dev/null

test: lint
	bash tests/perl/run_perl_checks.sh

smoke:
	nextflow run . -profile test,local

smoke-check:
	bash tests/smoke/check_outputs.sh results_test

docs:
	mkdocs build
