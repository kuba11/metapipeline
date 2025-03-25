#!/usr/bin/env

params.greeting = 'greetings.csv'
params.batch = 'wat'

workflow {

test(params.batch)

}



process test {
    publishDir 'results', mode: 'copy'

    input:
    val text

    output:
    path "test.txt"

    script:
    """
        cat ${text} > "test.txt"
    """
}

