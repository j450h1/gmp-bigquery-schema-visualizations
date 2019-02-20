#' Render Rmarkdown
#' A simple helper function for rendering multiple Rmd files
#' @param output a string of an Rmd file without the file extension
#'
render_rmd <- function(output){
  rmarkdown::render(input = paste0(output, ".Rmd"),
                    output_options = "all")
  
}

#' Upload html files to Google Cloud Storage
#' A simple helper function for uploading multiple html files to a GCS bucket
#' @param output a string of the outfile name to be uploaded to GCS 
#' with no file extension
#' @param outfile a string of the file's destination GCS path including the 
#' filename but no file extension
#' 
upload_to_gcs <- function(output,
                          outfile){
  gcs_upload(file = paste0(output, ".html"),
             name = paste0(outfile, ".html"),
             predefinedAcl = c("publicRead"))
  
}   