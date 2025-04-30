#' Apply Multiple Highlights
#'
#' Applies NA, max, or min highlights in one step.
#' @param data A data frame.
#' @param what What to highlight: "na", "max", "min".
#' @param colset A list of colors.
#' @return A datatable.
#' @export
`%or%` <- function(a, b) {
  if (!is.null(a)) a else b
}

style_data <- function(data, what = c("na", "max", "min"), colset = list()) {
  out <- DT::datatable(data)
  cols_num <- names(data)[sapply(data, is.numeric)]

  if ("na" %in% what) {
    col_na <- colset$na %or% "lightpink"
    out <- out %>% DT::formatStyle(
      columns = names(data),
      backgroundColor = DT::styleEqual(NA, col_na)
    )
  }

  if ("max" %in% what) {
    col_max <- colset$max %or% "lightgreen"
    for (c in cols_num) {
      m <- max(data[[c]], na.rm = TRUE)
      out <- out %>% DT::formatStyle(
        columns = c,
        backgroundColor = DT::styleEqual(m, col_max)
      )
    }
  }

  if ("min" %in% what) {
    col_min <- colset$min %or% "lightblue"
    for (c in cols_num) {
      m <- min(data[[c]], na.rm = TRUE)
      out <- out %>% DT::formatStyle(
        columns = c,
        backgroundColor = DT::styleEqual(m, col_min)
      )
    }
  }

  out
}
