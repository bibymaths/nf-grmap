process MATCH {
    tag "${meta.sample}"
    publishDir "${params.outdir}/matched", mode: params.publish_mode

    input:
    tuple val(meta), path(reads)
    path reference

    output:
    tuple val(meta), path("${meta.sample}.matched")

    script:
    """
    perl ${projectDir}/scripts/match.pl ${reads} ${reference} ${params.querysize} > ${meta.sample}.matched
    """
}
