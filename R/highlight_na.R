#' Highlight Missing Values (NA)
#'
#' Highlights all NA values in a data frame by applying a background color using the DT package.
#'
#' @param df A data frame to be processed.
#' @param color A character string specifying the highlight color. Default is "lightpink".
#'
#' @return A \code{DT::datatable} object with NA values highlighted.
#' @export
#'
#' @examples
#' df <- data.frame(a = c(1, NA, 3), b = c(NA, 2, 3))
#' highlight_na(df)
#' Highlight NA values in a DataFrame
#'
#' @param df A dataframe.
#' @param color Background color for NA cells. Default is 'lightpink'.
#' @return A DT datatable object with NA cells highlighted.
#' @export
highlight_na <- function(df, color = "lightpink") {
  DT::datatable(df) %>%
    DT::formatStyle(
      columns = names(df),
      backgroundColor = DT::styleEqual(NA, color)
    )
}