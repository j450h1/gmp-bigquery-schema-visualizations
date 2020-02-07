## load packages and authenticate via service account since recommended 
## assumes the following
## 1. service account created, JSON key downloaded and saved to your machine
## 2. `.Renviron` file created in this projects directory 
## 3. `GCS_AUTH_FILE` or path to JSON set as environment variable in 
## `.Renviron` file (e.g. - GCS_AUTH_FILE="/Users/justin/.../key.json") 
## more details here: 
## https://github.com/cloudyr/googleCloudStorageR/issues/81#issuecomment-346043137
## http://code.markedmondson.me/googleCloudStorageR/#setting-environment-variables
library(googleAuthR)
library(googleCloudStorageR)

## set options then print to sanity check
options(
  googleAuthR.scopes.selected = c(
    "https://www.googleapis.com/auth/cloud-platform"))
print(options()$googleAuthR.scopes.selected)

## load custom functions from seperate scripts 
## to make workflow easier to adapt in the future
source("./scripts/functions.R")

## check global bucket set in .Renviron file to ensure uploading to correct one
## assumes the following
## 1. `.Renviron` file created in this projects directory 
## 2. `GCS_DEFAULT_BUCKET` or GCS bucket name set as environment variable in 
## `.Renviron` file (e.g. - GCS_DEFAULT_BUCKET="your-gcs-bucket") 
## more details here:
## http://code.markedmondson.me/googleCloudStorageR/#setting-environment-variables
gcs_get_global_bucket()

## uplaod to gcs and set permissions so anyone can view it 
upload_to_gcs(output = "ga360",
              outfile = "visualizations/bigquery/ga360-schema")
upload_to_gcs(output = "firebase",
              outfile = "visualizations/bigquery/firebase-schema")

