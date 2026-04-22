process PLOT_TSS_TYPE {
    publishDir params.outdir, mode: params.publish_mode

    input:
    path merged

    output:
    path 'tss_type.png', emit: tss_type_png

    script:
    """
    python ${projectDir}/bin/plot_tss_type.py \
      --input ${merged} \
      --output tss_type.png
    """
}