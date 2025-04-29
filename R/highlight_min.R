#' Highlight Minimum Values
#'
#' Highlights the minimum values in each numeric column of a data frame.
#'
#' @param df A data frame to be processed.
#' @param color A character string specifying the highlight color. Default is "lightblue".
#'
#' @return A \code{DT::datatable} object with min values highlighted.
#' @export
#'
#' @examples
#' df <- data.frame(a = c(1, 2, 3), b = c(5, 9, 6))
#' highlight_min(df)
#' Highlight Minimum Values in Each Numeric Column
#'
#' @param df A dataframe.
#' @param color Background color for minimum values. Default is 'lightblue'.
#' @return A DT datatable object with minimum values highlighted.
#' @export
highlight_min <- function(df, color = "lightblue") {
  dt <- DT::datatable(df)
  numeric_cols <- names(df)[sapply(df, is.numeric)]
  
  for (col in numeric_cols) {
    min_val <- min(df[[col]], na.rm = TRUE)
    dt <- dt %>%
      DT::formatStyle(
        columns = col,
        backgroundColor = DT::styleEqual(min_val, color)
      )
  }
  return(dt)
}