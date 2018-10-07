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
#'   YYYY-MM-DD format. Default is system date today.
#'
#' @return Return type is tibble has columes contain index, date, open, high, low, close.
#'
#' @examples
#' \donttest{
#' index <- ubci_index(index = "UBMI")
#' index
#'
#' ubci_index(index = "UBMI", from="2018-05-15")
#' ubci_index(index = "UBMI", to="2018-05-15")
#' }
#'
#' @export
#' @importFrom httr GET content
#' @importFrom lubridate ymd_hms ymd period
#' @importFrom dplyr transmute select bind_cols

ubci_index <- function(index = "UBMI",
                       from = "2000-01-01",
                       to = as.character(Sys.Date())) {
  . <- candleDateTime <- code <- high <-
    highPrice <- low <- lowPrice <-
    openingPrice <- tradePrice <- NULL

  index <- toupper(gsub("IDX\\.UPBIT\\.", "", index))
  tar <-
    paste0(
      "https://crix-api-cdn.upbit.com/v1/crix/candles/days?code=IDX.UPBIT.",
      index,
      "&count=10000"
    )
  dat <- httr::GET(tar) %>%
    httr::content() %>%
    do.call(rbind, .) %>%
    data.frame() %>%
    dplyr::select(candleDateTime,
                  code,
                  openingPrice,
                  highPrice,
                  lowPrice,
                  tradePrice) %>%
    lapply(unlist) %>%
    dplyr::bind_cols() %>%
    dplyr::transmute(
      index = toupper(gsub("IDX\\.UPBIT\\.", "", code)),
      date = lubridate::ymd(lubridate::ymd_hms(candleDateTime)),
      open = openingPrice,
      high = highPrice,
      low = lowPrice,
      close = tradePrice
    )

  dat <- period(dat, from, to)
  return(dat)
}
