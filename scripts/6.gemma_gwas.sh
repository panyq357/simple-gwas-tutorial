gemma \
    -bfile resources/gwas \
    -gk 1 \
    -outdir resources
    -o gemma_kinship

gemma \
    -bfile resources/gwas \
    -k resources/gemma_kinship.cXX.txt \
    -lmm 1 \
    -outdir resources \
    -o gemma_gwa
