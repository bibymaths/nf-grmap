process PLOT_TSS_DISTANCE {
    publishDir params.outdir, mode: params.publish_mode

    input:
    path merged

    output:
    path 'tss_distance.png', emit: tss_distance_png

    script:
    """
    python ${projectDir}/bin/plot_tss_distance.py \
      --input ${merged} \
      --output tss_distance.png
    """
}