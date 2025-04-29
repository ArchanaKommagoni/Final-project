#' Display Column Types
#'
#' Returns a simple summary of each column's name and data type.
#'
#' @param df A data frame to be summarized.
#'
#' @return A data frame with two columns: \code{Name} and \code{Type}.
#' @export
#'
#' @examples
#' df <- data.frame(a = 1:3, b = c("x", "y", "z"))
#' pretty_types(df)
#' Show a Pretty Summary of DataFrame Column Types
#'
#' @param df A dataframe.
#' @return A small summary dataframe showing column names and types.
#' @export
pretty_types <- function(df) {
  summary_df <- data.frame(
    Column = names(df),
    Type = sapply(df, class),
    stringsAsFactors = FALSE
  )
  return(summary_df)
}