process SUMMARIZE_MATCHES {
    publishDir params.outdir, mode: params.publish_mode

    input:
    path merged

    output:
    path 'summary_counts.txt', emit: summary_txt

    script:
    """
    set -euo pipefail

    cut -f9,10,15 ${merged} \
      | tail -n +2 \
      | sort \
      | uniq -c \
      | awk '{printf "%s\\t%s\\t%s\\t%s\\n", \$2, \$3, \$4, \$1}' \
      > summary_counts.txt
    """
}