#!/usr/bin/env

include { hicexplorer } from './modules/hicexplorer.nf'
params.resolution = 50000
params.hic = './data/hic/*'
params.mcool = './data/mcool/*'

workflow {

samples_hic = Channel.fromPath(params.hic)

pre_mcool = Channel.fromPath(params.mcool)
    .map{ x -> "${x.toString()}::/resolutions/${params.resolution}" }
    .set{ samples_mcool }
samples = Channel.of('BRNO0414')


//test(params.batch)
//topDom()
hicexplorer(samples_mcool, samples, 1)
//hicSeg()
//tadBit()
//tadTree()

//spectralTAD()
//arrowhead()
//tadLib()
//armatus()
//onTad()
}




