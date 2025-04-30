#' Highlight NA Values
#'
#' Highlights all NA values in a data frame.
#' @param d A data frame.
#' @param shade Color for NA cells. Default is lightpink.
#' @return A datatable.
#' @export
tag_na <- function(d, shade = "lightpink") {
  DT::datatable(d) %>%
    DT::formatStyle(
      columns = names(d),
      backgroundColor = DT::styleEqual(NA, shade)
    )
}