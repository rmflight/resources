
#!/usr/bin/Rscript
#
# Installation:
#
# Copy this file to an accessible location, and then do a chmod u+x last_modified_files
#
# Make sure you have docopt installed: install.packages("docopt")
#
# License: MIT. Copyright Robert M Flight, 2018.
#
"Usage:
  last_modified_files [--directory=<directory>] [--number_of_files=<number_of_files>]
  last_modified_files [--directory=<directory>]
  last_modified_files [--number_of_files=<number_of_files>]
  last_modified_files (-h | --help)
  last_modified_files

Description: Show the last modified files in the specified directory. Recursively
 searches the provided directory, sorts the files by modified time, and shows
 the last [number_of_files] number of most recently modified files.

Options:
  --directory=<directory>             The directory to start from [default: .]
  --number_of_files=<number_of_files> How many files to show [default: 5]

" -> doc

library(methods)
library(docopt)

script_options <- docopt(doc)

main <- function(script_options){
  #print(script_options)

  system("export COLUMNS=COLUMNS")
  terminal_width <- Sys.getenv("COLUMNS")

  options(width=as.integer(terminal_width))

  all_files <- list.files(path = script_options$directory,
                          all.files = FALSE,
                          full.names = TRUE,
                          recursive = TRUE,
                          include.dirs = TRUE)

  all_files <- grep(".Rproj", all_files, value = TRUE, invert = TRUE)
  file_info <- file.info(all_files)
  file_info$file <- rownames(file_info)
  #rownames(file_info) <- NULL
  file_info <- file_info[!file_info$isdir, ]

  file_info <- file_info[order(file_info$mtime, decreasing = TRUE), ]
  print(file_info[seq(1, as.numeric(script_options$number_of_files)), c("file", "mtime")], row.names = FALSE)
  system("unset COLUMNS")
}

main(script_options)