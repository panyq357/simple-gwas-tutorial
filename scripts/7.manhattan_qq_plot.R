library(tidyverse)
library(qqman)

gwa_result <- read_tsv("resources/gemma_gwa.assoc.txt")

pdf("results/qq.pdf")
qq(gwa_result$p_wald)
dev.off()

pdf("results/manhattan.pdf")
manhattan(gwa_result, chr = "chr", bp = "ps", snp = "rs", p = "p_wald")
dev.off()

top10 <- function(chrom) {
    gwa_result %>%
        mutate(ps = as.character(ps)) %>%
        filter(chr == chrom) %>%
        arrange(p_wald) %>%
        select(chr, ps, p_wald, allele0, allele1) %>%
        slice_head(n = 10)
}

top10(5)
