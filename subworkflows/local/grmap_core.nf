include { MATCH } from '../../modules/local/match'
include { ANNOTATE } from '../../modules/local/annotate'

workflow GRMAP_CORE {
    take:
    ch_samples
    ch_reference

    main:
    ch_matched = MATCH(ch_samples, ch_reference)

    ch_annotate_input = ch_matched.map { meta, matched ->
        tuple(meta, matched, file(meta.gff), file(meta.tss), file(meta.cpg), file(meta.repeatmasker))
    }

    ch_annotated = ANNOTATE(ch_annotate_input)

    emit:
    annotated = ch_annotated
}
