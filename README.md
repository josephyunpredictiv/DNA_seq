# DNA_seq
DNA seq analysis pipeline for biowulf hpc.

Assuming that the file names are: 
35K_1100_1.fastq.gz
35K_1100_2.fastq.gz

Here is a pipeline to run the entire DNA seq from:
1. Alignment to generate sam file from fastq using bwa-mem2
2. Sam to bam
3. Sort bam
4. Index sorted bam file
5. Variant Calling using Freebayes


To create pipeline with correct paths
$ bash dna_seq_variant_calling_v1.sh 35K_1100 > dna_seq_variant_calling_v1_35K_1100.sh

To run sbatch on biowulf hpc
$ ​​sbatch --mem=50g --cpus-per-task=32 dna_seq_variant_calling_v1_35K_1100.sh
