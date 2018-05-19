#' get ubci index
#'
#' get ubci index data from source. Source is \href{https://www.ubcindex.com/indexes}{here}.
#'
#' @param index default is UBMI.
#' @param from Optional for various time series.
#'   A character string representing a start date in
#'   YYYY-MM-DD format.
#' @param to Optional for various time series.
#'   A character string representing an end date in
#'   YYYY-MM-DD format.
#'
#' @return Return type is tibble has columes contain index, date, open, high, low, close.
#'
#' @examples
#' \dontrun{
#' index <- ubci_index(index = "UBMI")
#' index
#'
#' ubci_index(index = "UBMI", from="2018-05-15")
#' ubci_index(index = "UBMI", to="2018-05-15")
#' }
#'
#' @export
#' @importFrom httr GET content
#' @importFrom tidyr unnest
#' @importFrom tibble as_tibble
#' @importFrom lubridate ymd_hms ymd
#' @importFrom dplyr mutate

ubci_index <- function(index = "UBMI", from, to) {
  index <- toupper(gsub("IDX\\.UPBIT\\.","",index))
  tar <-
    paste0(
      "https://crix-api-cdn.upbit.com/v1/crix/candles/days?code=IDX.UPBIT.",
      index,
      "&count=10000"
    )
  res <- httr::GET(tar) %>%
    httr::content()
  dat <- do.call(rbind, res) %>%
    data.frame
  dat$signedChangePrice[[nrow(dat)]] <- 0
  dat <- dat %>%
    tidyr::unnest() %>%
    tibble::as_tibble() %>%
    dplyr::mutate(date = lubridate::ymd(lubridate::ymd_hms(candleDateTime)),
                  index=toupper(gsub("IDX\\.UPBIT\\.","",code)),
                  open=openingPrice,
                  high=highPrice,
                  low=lowPrice,
                  close=tradePrice
                  ) %>%
    dplyr::select(index,
                  date,
                  open,
                  high,
                  low,
                  close)
  dat <- period(dat,from,to)
  return(dat)
}
