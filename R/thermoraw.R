# Copyright Robert M Flight, 2019
# MIT Licensed. Use at your own risk, with no warranty.
#' extract raw method
#'
#' Given a Thermo ".raw" file, attempts to extract the "method"
#' definition from a translated hexdump of the file.
#'
#' @param in_file The Thermo raw file to extract
#' @param output_type string, data.frame or json
#'
#' @export
#' @return string or data.frame
extract_raw_method = function(in_file, output_type = "data.frame"){
  in_file2 = normalizePath(in_file)

  # performs a hexdump of the binary file, with translation,
  # and captures it in a text string
  # Output (on linux) looks like:
  #
  # 02 .... |translated contents|
  # .
  # .
  sys_data = system2("hexdump", args = c("-C", in_file2), stdout = TRUE)

  # this pattern extracts the translated contents between the pipe on each line
  pipe_pattern = "(?<=\\|)[^|]++(?=\\|)"
  pipe_content = stringr::str_extract(sys_data, pipe_pattern)

  # the output has weird dots embedded. Two or more dots seem to indicate spaces,
  # whereas single dots should just be removed. Hence the substitution below
  pipe_nodots = gsub("\\.", "", gsub("\\.\\.", " ", pipe_content))

  # In my experience (with a small number of files), the method
  # is normally embedded in the first 2000 translated lines
  pipe_pasted = paste(pipe_nodots[1:2000], sep = "", collapse = "")

  # extract the method definition
  method_pattern = "Method Summary.*New Method"
  method_text = stringr::str_extract(pipe_pasted, method_pattern)

  # and split across multiple spaces
  method_split = strsplit(method_text, "  ")[[1]]

  # now we push it into a data.frame
  has_char = nchar(method_split) > 0
  method_split = method_split[has_char]
  method_split = method_split[2:(length(method_split) - 1)]

  method_df = data.frame(Variable = rep("", length(method_split)),
                         Value = rep("", length(method_split)),
                         stringsAsFactors = FALSE)

  for (irow in seq_along(method_split)) {
    i_equal = strsplit(method_split[irow], "=")[[1]]
    method_df[irow, 1] = trimws(i_equal[1])
    if (length(i_equal) == 2) {
      method_df[irow, 2] = trimws(i_equal[2])
    }
  }

  switch(output_type,
         string = return(method_split),
         data.frame = return(method_df),
         json = return(jsonlite::toJSON(method_df, pretty = TRUE)))


}