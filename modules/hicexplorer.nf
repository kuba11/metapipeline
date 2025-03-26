process hicexplorer {
    publishDir 'results', method: 'copy'
    container = 'continuumio/miniconda3'
    conda 'bioconda::hicexplorer'

    input:
    val input_files
    val sample
    val proc

    output:
    path "${sample}_domains.bed"

    script:
    """
    hicFindTADs -m ${input_files} --outPrefix ${sample} --numberOfProcessors ${proc} --correctForMultipleTesting fdr
    """


}