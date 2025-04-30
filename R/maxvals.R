#' Highlight Max Values
#'
#' Marks the largest number in each numeric column.
#' @param d A data frame.
#' @param shade Color to highlight the max. Default is lightgreen.
#' @return A datatable.
#' @export
 
tag_high <- function(d, shade = "lightgreen") {
  tab <- DT::datatable(d)
  numcols <- names(d)[sapply(d, is.numeric)]

  for (n in numcols) {
    m <- max(d[[n]], na.rm = TRUE)
    tab <- tab %>% DT::formatStyle(
      columns = n,
      backgroundColor = DT::styleEqual(m, shade)
    )
  }

  tab
}