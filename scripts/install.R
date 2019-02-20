# install required packages from CRAN
packages_list <- c("rmarkdown",
                   "xml2",
                   "rvest",
                   "dpylr",
                   "tidyr",
                   "stringr",
                   "data.tree",
                   "collapsibleTree",
                   "DT",
                   "flexdashboard",
                   "googleAuthR",
                   "googleCloudStorageR")

new_packages <- packages_list[!(packages_list %in% installed.packages()[,"Package"])]
if(length(new_packages)) install.packages(new_packages)
