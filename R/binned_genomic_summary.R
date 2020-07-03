#' calculate binned values
#'
#' given a set of genomic bins and an RLE-list object, return value
#'
#' Adapted from documentation of \code{tileGenome}
#'
#' @param bins a \code{GRanges} object representing genomic bins
#' @param numvar a named \code{RleList} object representing numerical variable along the genome
#' @param binfun character string of the function to apply
#' @param mcolname the name of the metadata column containing the binned value of the object
#' @export
#' @return bins with the \code{mcolname} containing the binned value
binned_function <- function(bins, numvar, binfun = "mean", mcolname = "avg"){
  stopifnot(is(bins, "GRanges"))
  stopifnot(is(numvar, "RleList"))

  bin_names <- seqlevels(bins)
  numvar_names <- names(numvar)

  calc_names <- intersect(bin_names, numvar_names)

  stopifnot(length(calc_names) > 0)

  zero_names <- setdiff(bin_names, numvar_names)
  has_bin_names <- FALSE
  if (length(names(bins)) != 0){
    has_bin_names <- TRUE
  }


  bins_per_seqname <- split(ranges(bins), as.character(seqnames(bins)))

  calc_list <- mclapply(calc_names,
                        function(seqname){
                          views <- Views(numvar[[seqname]],
                                         bins_per_seqname[[seqname]])
                          switch(binfun,
                                 mean = viewMeans(views),
                                 sum = viewSums(views),
                                 min = viewMins(views),
                                 max = viewMaxs(views))
                        })

  zero_list <- lapply(zero_names,
                      function(seqname){
                        zero_bin <- bins_per_seqname[[seqname]]
                        n_zero_bin <- length(zero_bin)
                        out_bin <- vector("numeric", n_zero_bin)
                        if (has_bin_names){
                          names(out_bin) <- names(zero_bin)
                        }
                        out_bin
                      })
  names(calc_list) <- calc_names
  names(zero_list) <- zero_names
  bin_list <- c(calc_list, zero_list)
  bin_list <- bin_list[bin_names]
  new_mcol <- unsplit(bin_list, as.factor(as.character(seqnames(bins))))
  mcols(bins)[[mcolname]] <- new_mcol
  return(bins)
}