nextflow.enable.dsl = 2

include { GRMAP } from './workflows/grmap'

workflow {
    GRMAP()
}
