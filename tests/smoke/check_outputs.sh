#!/usr/bin/env bash
set -euo pipefail

outdir="${1:-results_test}"

required=(
  "$outdir/matched/illumina_reads_40.matched"
  "$outdir/annotated/illumina_reads_40.annotated.tsv"
  "$outdir/all_samples.annotated.tsv"
  "$outdir/summary_counts.txt"
  "$outdir/tss_distance.png"
  "$outdir/tss_type.png"
)

missing=0
for f in "${required[@]}"; do
  if [[ ! -s "$f" ]]; then
    echo "Missing or empty: $f" >&2
    missing=1
  fi
done

if [[ $missing -ne 0 ]]; then
  exit 1
fi

echo "Smoke outputs verified in $outdir"
