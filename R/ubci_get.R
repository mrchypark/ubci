#' get ubci
#'
#' get ubci data.
#'
#' @param index default is UBMI.
#' @param count default is 10000.
#'
#' @export
#' @importFrom httr GET content
#' @importFrom tidyr unnest
#' @importFrom tibble tibble

ubci_get <- function(index = "UBMI", count = 10000) {
  tar <-
    paste0(
      "https://crix-api-cdn.upbit.com/v1/crix/candles/days?code=IDX.UPBIT.",
      index,
      "&count=",
      count
    )
  res <- httr::GET(tar)
  obj <- httr::content(res)
  dat <- do.call(rbind, obj)
  dat <- data.frame(dat)
  dat$signedChangePrice[[nrow(dat)]]<-0
  dat <- tidyr::unnest(dat)
  dat <- tibble::tibble(dat)
  return(dat)
}
