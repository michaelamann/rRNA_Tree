library(tidyverse)
library(microseq) # read in fastas
library(furrr) # run it in parallel


extract_rRNA_reads <- function(dat){
  
  dat %>%
    filter(str_detect(Header, pattern = "18S ribosomal RNA") |
           str_detect(Header, pattern = "28S ribosomal RNA") |
           str_detect(Header, pattern = "5.8S ribosomal RNA"))
}

# going to use all cores
plan(multicore)


tibble(file_name = list.files(pattern = "rna_from_genomic.fna.gz")) %>%
  mutate(compiled = future_map(.x = file_name, .f = readFasta)) %>%
  mutate(compiled = future_map(.x = compiled, .f =  extract_rRNA_reads)) %>%
  unnest_longer(compiled) %>%
  write_rds(file = "rna_annotations_genomes.rds")