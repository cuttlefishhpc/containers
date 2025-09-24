
options(repos = c(CRAN = "https://cloud.r-project.org"))

BiocManager::install(c("Biostrings", "rtracklayer"))
devtools::install_github("jtlovell/GENESPACE")
