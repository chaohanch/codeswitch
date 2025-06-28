library(tidyverse)

# set up working directory
setwd("~/OneDrive - University of Toronto/Projects/codeswitch/codeswitch_mystim/stimuli/")

# read in stim lists
df_list1 <- read_tsv("EEG_codeswitch_list1.tsv")
df_list2 <- read_tsv("EEG_codeswitch_list2.tsv")
df_list3 <- read_tsv("EEG_codeswitch_list3.tsv")
df_list4 <- read_tsv("EEG_codeswitch_list4.tsv")

# read in mapping file
df_mapping <- read_table("/Users/chaohan/Documents/GitHub/codeswitch/mapping_file.txt")

# combine lists
df_combined <- rbind(df_list1, df_list2, df_list3, df_list4) %>%
  mutate(filename = sound_file) %>%
  select(c(filename, target_onset))
  
# add target onset column to mapping file
df_mapping_new <- df_mapping %>%
  left_join(df_combined, by = "filename")


# export txt
write_delim(df_mapping_new, file = "/Users/chaohan/Documents/GitHub/codeswitch/mapping_file.txt", delim = "\t")