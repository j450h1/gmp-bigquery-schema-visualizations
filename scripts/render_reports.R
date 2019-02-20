## load packages 
library(rmarkdown)

## load custom functions from seperate scripts 
## to make workflow easier to adapt in the future
source("./scripts/functions.R")

## render rmd files as html so we can upload to GCS for public visibility
render_rmd(output = "ga360")
render_rmd(output = "firebase")
