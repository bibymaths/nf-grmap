process PLOT_COUNTS_AND_CPG_GC {
    publishDir params.outdir, mode: params.publish_mode

    input:
    path summary

    output:
    path 'gene_counts.png', emit: gene_counts_png
    path 'gene_cpg_gc.png', emit: gene_cpg_gc_png

    script:
    """
    python ${projectDir}/bin/plot_counts_and_cpg_gc.py \
      --input ${summary} \
      --gene-counts gene_counts.png \
      --gene-cpg-gc gene_cpg_gc.png
    """
}