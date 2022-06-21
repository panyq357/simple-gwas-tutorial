library(tidyverse)

col_names <- c("FID", "IID", "Father", "Mother", "Sex", "Value")

empty_fam <- read_delim("resources/gwas.fam", col_names = col_names, delim = " ")
selected_fam <- read_delim("resources/selected.fam", col_names = col_names, delim = " ")

sorted_values <- selected_fam$Value[match(empty_fam$IID, selected_fam$IID)]

sorted_fam <- empty_fam %>%
    mutate(Value = sorted_values)

write_delim(sorted_fam, "resources/gwas.fam", delim = " ", col_names = F)
