process ANNOTATE {
    tag "${meta.sample}:${meta.chromosome}"
    publishDir "${params.outdir}/annotated", mode: params.publish_mode

    input:
    tuple val(meta), path(matched), path(gff), path(tss), path(cpg), path(repeatmasker)

    output:
    tuple val(meta), path("${meta.sample}.annotated.tsv")

    script:
    """
    perl ${projectDir}/scripts/annotate.pl \
      ${matched} ${gff} ${tss} ${cpg} ${repeatmasker} ${meta.chromosome} \
      > ${meta.sample}.annotated.tsv
    """
}
