process MERGE_ANNOTATED {
    publishDir params.outdir, mode: params.publish_mode

    input:
    path annotated_files

    output:
    path 'all_samples.annotated.tsv'

    script:
    """
    mapfile -t files < <(ls *.annotated.tsv | sort)
    if [[ ${#files[@]} -eq 0 ]]; then
      echo "No annotation files found" >&2
      exit 1
    fi

    head -n1 "${files[0]}" > all_samples.annotated.tsv
    for f in "${files[@]}"; do
      tail -n +2 "$f" >> all_samples.annotated.tsv
    done
    """
}
