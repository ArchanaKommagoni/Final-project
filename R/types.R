#' Show Column Types
#'
#' Gives a list of column names and types.
#' @param x A data frame.
#' @return A data frame of names and types.
#' @export
col_types <- function(x) {
  data.frame(
    field = names(x),
    kind = sapply(x, class),
    stringsAsFactors = FALSE
  )
}