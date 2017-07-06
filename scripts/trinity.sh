#!/bin/bash
#
#$ -N trinity
# #SBATCH --cpus-per-task=2
#$ -o ../log/trinity-%j.out
#$ -e ../log/trinity-%j.err
#$ -l mem_free=2G
#SBATCH --partition=mcore
echo "SLURM_JOBID="$JOB_ID
echo "SLURM_JOB_NODELIST="$PE_HOSTFILE
echo "SLURM_NNODES="$SGE_TASK_STEPSIZE
echo "working directory = "$SGE_O_WORKDIR

module load trinityrnaseq bowtie2
PREFIX=$1
DIRECTORY=$2
echo "prefix is $PREFIX and directory is $DIRECTORY"
echo "left file is ${DIRECTORY}/data/${PREFIX}.R1.fastq"
ls -l ${DIRECTORY}/data/${PREFIX}.R1.fastq
echo "right file is ${DIRECTORY}/data/${PREFIX}.R2.fastq"
ls -l ${DIRECTORY}/data/${PREFIX}.R2.fastq
#Trinity --seqType fq --left ${DIRECTORY}/data/${PREFIX}.R1.fastq --right ${DIRECTORY}/data/${PREFIX}.R2.fastq --output $TMPDIR/trinity --min_contig_length 1000 --CPU 2 --max_memory 100G --no_bowtie
echo "left is"
ls -la /proj/aims/pipelinepaper/github/holovir/testdata_20160413/03assembly/data/c12-2.R1.fastq
echo "right is"
ls -la /proj/aims/pipelinepaper/github/holovir/testdata_20160413/03assembly/data/c12-2.R2.fastq
Trinity --seqType fq --max_memory 100G --left /proj/aims/pipelinepaper/github/holovir/testdata_20160413/03assembly/data/c12-2.R1.fastq --right /proj/aims/pipelinepaper/github/holovir/testdata_20160413/03assembly/data/c12-2.R2.fastq
#Trinity --seqType fq --left /proj/aims/pipelinepaper/github/holovir/testdata_20160413/03assembly/data/c12-2.R1.fastq --right /proj/aims/pipelinepaper/github/holovir/testdata_20160413/03assembly/data/c12-2.R2.fastq --output /proj/aims/pipelinepaper/github/holovir/testdata_20160413/03assembly/results/trinity --full_cleanup --min_contig_length 1000 --CPU 2 --max_memory 100G --no_bowtie

#cp $TMPDIR/trinity.Trinity.fasta ${DIRECTORY}/results/$PREFIX.trinity.contigs.fasta
#rm -rf $TMPDIR/*
