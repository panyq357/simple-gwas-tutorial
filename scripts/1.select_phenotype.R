library(tidyverse)

grain_width <- read_tsv(
    "rawdata/grain_width.zip",
    col_names = c("ID", "Value")
)

set.seed(1)

selected_fam <- grain_width %>%
    slice_sample(n = 300) %>%
    transmute(FID = ID, IID = ID, Father = 0, Mother = 0, Sex = 0,  Value)

write_delim(selected_fam, "resources/selected.fam", col_names = F, delim = " ")
