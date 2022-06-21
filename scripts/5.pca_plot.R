library(tidyverse)

eigenval <- scan("resources/pca_matrix.eigenval")
eigenvec <- read_delim(
    "resources/pca_matrix.eigenvec",
    col_names = c("FID", "IID", paste0("PC", 1:length(eigenval)))
)

pdf("results/pca.pdf")
ggplot(eigenvec) +
    geom_point(aes(x = PC1, y = PC2)) +
    labs(
        title = "PCA Plot",
        x = sprintf("PC1 Eigenvalue: %.2f", eigenval[1]),
        y = sprintf("PC2 Eigenvalue: %.2f", eigenval[2]),
    )
dev.off()
