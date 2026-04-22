process SUMMARIZE_MATCHES {
    publishDir params.outdir, mode: params.publish_mode

    input:
    path merged

    output:
    path 'summary_counts.txt'

    script:
    """
    cut -f9,10,15 ${merged} \
      | tail -n +2 \
      | sort \
      | uniq -c \
      | awk '{print $2"\t"$3"\t"$4"\t"$1}' \
      > summary_counts.txt
    """
}
