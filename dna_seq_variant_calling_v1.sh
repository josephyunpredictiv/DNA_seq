echo "#!/bin/bash"

sample=$1


echo "set -e"
echo "module load bwa-mem2 samtools freebayes"
echo "cd /************"

#Alignment to generate sam file from fastq using bwa-mem2
command1="bwa-mem2 mem -t \$SLURM_CPUS_PER_TASK /fdb/bwa-mem2/hg38/genome.fa ${sample}_1.fastq.gz ${sample}_2.fastq.gz > /**********/${sample}.sam"
echo $command1
#eval $command1

#Sam to bam
command2="samtools view -bo ${sample}.bam ${sample}.sam"
echo $command2
#eval $command2

# Sort bam
command3="samtools sort -o ${sample}_sorted.bam ${sample}.bam"
echo $command3
#eval $command3

# Index sorted bam file
command4="samtools index ${sample}_sorted.bam"
echo $command4
#eval $command4

# Variant Calling using Freebayes
command5="freebayes --fasta-reference /fdb/igenomes/Homo_sapiens/UCSC/hg38/Sequence/WholeGenomeFasta/genome.fa ${sample}_sorted.bam > ${sample}_sorted.vcf"
echo $command5
#eval $command5

