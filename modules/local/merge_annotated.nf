process MERGE_ANNOTATED {
    publishDir params.outdir, mode: params.publish_mode

    input:
    path annotated_files

    output:
    path 'all_samples.annotated.tsv'

    script:
    """
    first_file=$(ls *.annotated.tsv | head -n1)
    head -n1 "${first_file}" > all_samples.annotated.tsv
    for f in *.annotated.tsv; do
      tail -n +2 "$f" >> all_samples.annotated.tsv
    done
    """
}
