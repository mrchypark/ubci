#' get ubci
#'
#' get ubci data.
#'
#' @param index default is UBMI.
#' @param count default is 10000.
#'
#' @export
#' @importFrom httr GET content
#' @importFrom tibble as_tibble

ubci_get <- function(index = "UBMI", count = 10000) {
  tar <-
    paste0(
      "https://crix-api-cdn.upbit.com/v1/crix/candles/days?code=IDX.UPBIT.",
      index,
      "&count=",
      count
    )
  res <- httr::GET(tar)
  jsonReturn <- httr::content(res)
  dat <- do.call(rbind, jsonReturn)
  # dat <- data.frame(apply(dat, 2, unlist),stringsAsFactors = F)as
  return(dat)
}
