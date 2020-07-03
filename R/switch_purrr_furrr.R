# so I have this code in two different packages now, and I'm thinking of making a single
# package that they (and other packages) could easily depend on, that lets the developer
# enable the use of furrr::future_map when a user has multi-processing available.
#
# basically the way this works right now, is after loading the package, if you want to use furrr::future_map
# you do:
# set_internal_map(furrr::future_map)
# plan(multiprocess)
# and magically you have multiprocessing everywhere I have
# internal_map$map_function()
# in my code.

#' pick map enumerator
#'
#' Allows the user to set which enumerator is being used internally in the functions.
#'
#' @param map_function which function to use, assigns it to an internal object
#'
#' @export
#' @return NULL
set_internal_map <- function(map_function = NULL){
  if (is.null(map_function)) {
    assign("map_function", purrr::map, envir = internal_map)
  } else {
    assign("map_function", map_function, envir = internal_map)
  }
}

# the default is to use purrr::map
internal_map <- new.env(hash = TRUE)
assign("map_function", purrr::map, envir = internal_map)