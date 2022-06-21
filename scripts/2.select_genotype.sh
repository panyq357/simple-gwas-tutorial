plink \
    --keep resources/selected.fam \
    --bfile rawdata/pruned_v2.1 \
    --make-bed \
    --out resources/gwas
