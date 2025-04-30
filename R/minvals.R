#' Highlight Min Values
#'
#' Marks the smallest number in each numeric column.
#' @param d A data frame.
#' @param shade Color to highlight the min. Default is lightblue.
#' @return A datatable.
#' @export
tag_low <- function(d, shade = "lightblue") {
  tab <- DT::datatable(d)
  numcols <- names(d)[sapply(d, is.numeric)]

  for (n in numcols) {
    m <- min(d[[n]], na.rm = TRUE)
    tab <- tab %>% DT::formatStyle(
      columns = n,
      backgroundColor = DT::styleEqual(m, shade)
    )
  }

  tab
}