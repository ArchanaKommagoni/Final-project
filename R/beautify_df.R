#' Beautify a Data Frame
#'
#' Applies multiple highlight styles to a data frame including NA, min, and max values.
#'
#' @param df A data frame to be beautified.
#' @param highlight A character vector specifying what to highlight. Options: \code{"na"}, \code{"min"}, \code{"max"}.
#' @param colors A named list specifying custom highlight colors for \code{na}, \code{min}, and \code{max}.
#'
#' @return A \code{DT::datatable} object with multiple highlight styles applied.
#' @export
#'
#' @examples
#' df <- data.frame(a = c(1, NA, 3), b = c(5, 9, 6))
#' beautify_df(df, highlight = c("na", "max"), colors = list(na = "lavenderblush", max = "lightgreen"))
#' Null coalescing operator
#'
#' This function returns the first argument if it is not NULL, otherwise returns the second.
#'
#' @param a First argument
#' @param b Second argument
#'
#' @return a or b
#' @examples
#' NULL %||% 5  # returns 5
#' 3 %||% 5     # returns 3
#' @export
`%||%`<- function(a, b) {
  if (!is.null(a)) a else b
}
#' Master Function to Beautify a DataFrame
#'
#' @param df A dataframe.
#' @param highlight Choose which to highlight: "na", "max", "min", or multiple.
#' @param colors List of colors for each highlight.
#' @return A beautified datatable.
#' @export
beautify_df <- function(df, highlight = c("na", "max", "min"), colors = list()) {
  dt <- DT::datatable(df)
  
  if ("na" %in% highlight) {
    na_color <- colors$na %||% "lightpink"
    dt <- dt %>% DT::formatStyle(
      columns = names(df),
      backgroundColor = DT::styleEqual(NA, na_color)
    )
  }
  
  numeric_cols <- names(df)[sapply(df, is.numeric)]
  
  if ("max" %in% highlight) {
    max_color <- colors$max %||% "lightgreen"
    for (col in numeric_cols) {
      max_val <- max(df[[col]], na.rm = TRUE)
      dt <- dt %>% DT::formatStyle(
        columns = col,
        backgroundColor = DT::styleEqual(max_val, max_color)
      )
    }
  }
  
  if ("min" %in% highlight) {
    min_color <- colors$min %||% "lightblue"
    for (col in numeric_cols) {
      min_val <- min(df[[col]], na.rm = TRUE)
      dt <- dt %>% DT::formatStyle(
        columns = col,
        backgroundColor = DT::styleEqual(min_val, min_color)
      )
    }
  }
  
  return(dt)
}

# helper for NULL default
`%||%` <- function(a, b) if (!is.null(a)) a else b
