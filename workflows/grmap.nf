include { GRMAP_CORE } from '../subworkflows/local/grmap_core'
include { MERGE_ANNOTATED } from '../modules/local/merge_annotated'
include { SUMMARIZE_MATCHES } from '../modules/local/summarize_matches'
include { PLOT_COUNTS_AND_CPG_GC } from '../modules/local/plot_counts_and_cpg_gc'
include { PLOT_TSS_DISTANCE } from '../modules/local/plot_tss_distance'
include { PLOT_TSS_TYPE } from '../modules/local/plot_tss_type'

workflow GRMAP {
    main:
    validateParams()

    ch_samples = buildSampleChannel()
    ch_reference = Channel.fromPath(params.reference, checkIfExists: true)

    ch_annotated = GRMAP_CORE(ch_samples, ch_reference).annotated
    ch_annotated_files = ch_annotated.map { meta, annotated -> annotated }

    merged = MERGE_ANNOTATED(ch_annotated_files.collect())
    summary = SUMMARIZE_MATCHES(merged)
    plots_counts = PLOT_COUNTS_AND_CPG_GC(summary)
    tss_distance = PLOT_TSS_DISTANCE(merged)
    tss_type = PLOT_TSS_TYPE(merged)

    emit:
    annotated = ch_annotated
    merged = merged
    summary = summary
    plots_counts = plots_counts
    tss_distance = tss_distance
    tss_type = tss_type
}

def validateParams() {
    if (!params.samplesheet && !params.input) {
        error "Provide either --samplesheet or --input"
    }
}

def buildSampleChannel() {
    if (params.samplesheet) {
        return Channel
            .fromPath(params.samplesheet, checkIfExists: true)
            .splitCsv(header: true)
            .map { row ->
                def required = ['sample', 'reads', 'chromosome', 'gff', 'tss', 'cpg', 'repeatmasker']
                required.each { key ->
                    if (!row[key]) {
                        error "Missing '${key}' column value in samplesheet row: ${row}"
                    }
                }
                def meta = [
                    sample      : row.sample,
                    chromosome  : row.chromosome,
                    gff         : row.gff,
                    tss         : row.tss,
                    cpg         : row.cpg,
                    repeatmasker: row.repeatmasker
                ]
                tuple(meta, file(row.reads))
            }
    }

    return Channel
        .fromPath(params.input, checkIfExists: true)
        .map { reads ->
            def sample = reads.simpleName.replaceAll(/\.fasta$/, '')
            def meta = [
                sample      : sample,
                chromosome  : params.chromosome,
                gff         : params.gff,
                tss         : params.tss,
                cpg         : params.cpg,
                repeatmasker: params.repeatmasker
            ]
            tuple(meta, reads)
        }
}
