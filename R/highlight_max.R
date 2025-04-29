#' Highlight Maximum Values
#'
#' Highlights the maximum values in each numeric column of a data frame.
#'
#' @param df A data frame to be processed.
#' @param color A character string specifying the highlight color. Default is "lightgreen".
#'
#' @return A \code{DT::datatable} object with max values highlighted.
#' @export
#'
#' @examples
#' df <- data.frame(a = c(1, 2, 3), b = c(5, 9, 6))
#' highlight_max(df)
#' Highlight Maximum Values in Each Numeric Column
#'
#' @param df A dataframe.
#' @param color Background color for maximum values. Default is 'lightgreen'.
#' @return A DT datatable object with maximum values highlighted.
#' @export
highlight_max <- function(df, color = "lightgreen") {
  dt <- DT::datatable(df)
  numeric_cols <- names(df)[sapply(df, is.numeric)]
  
  for (col in numeric_cols) {
    max_val <- max(df[[col]], na.rm = TRUE)
    dt <- dt %>%
      DT::formatStyle(
        columns = col,
        backgroundColor = DT::styleEqual(max_val, color)
      )
  }
  return(dt)
}