#' get coin price
#'
#' get coin price data from source. Source is <https://upbit.com/exchange>.
#' This page shows the multiple cryptocurrency price.
#'
#'
#' @param code coin name fom ubci_get_options() link "UPBIT.KRW-BTC".
#' @param from Optional for various time series.
#'   A character string representing a start date in
#'   YYYY-MM-DD format. Default is 2000-01-01.
#' @param to Optional for various time series.
#'   A character string representing an end date in
#'   YYYY-MM-DD format. Default is system date today.
#'
#' @return Return type is tibble has columes contain code, date, open, high, low, close, volume.
#'
#' @examples
#' \donttest{
#' btc <- ubci_get(code = "UPBIT.KRW-BTC")
#' btc
#'
#' ubci_get(code = "UPBIT.KRW-BTC", from="2018-05-15")
#' ubci_get(code = "UPBIT.KRW-BTC", to="2018-05-15")
#' }
#'
#' @export
#' @importFrom httr GET content
#' @importFrom tidyr unnest
#' @importFrom tibble as_tibble
#' @importFrom lubridate ymd_hms ymd
#' @importFrom dplyr mutate

ubci_get <- function(code,
                     from,
                     # = "2000-01-01",
                     #  = as.character(Sys.Date())
                     to) {
  candleDateTime <- openingPrice <-
    highPrice <- lowPrice <- tradePrice <-
    candleAccTradeVolume <- high <- low <-
    volume <- NULL

  index <- toupper(gsub("CRIX\\.", "", code))
  tar <-
    paste0(
      "https://crix-api-cdn.upbit.com/v1/crix/candles/days?code=CRIX.",
      code,
      "&count=10000"
    )

  dat <- httr::GET(tar) %>%
    httr::content()

  if (!is.null(dat$error)) {
    stop(
      paste0(
        dat$message,
        "Please check for sure code is in ubci_get_options(), column code."
      )
    )
  }
  dat <- do.call(rbind, dat) %>%
    data.frame %>%
    dplyr::select(1:8) %>%
    tidyr::unnest() %>%
    tibble::as_tibble() %>%
    dplyr::transmute(
      code = gsub("CRIX\\.", "", code),
      date = lubridate::ymd(lubridate::ymd_hms(candleDateTime)),
      open = openingPrice,
      high = highPrice,
      low = lowPrice,
      close = tradePrice,
      volume = candleAccTradeVolume
    )
  dat <- period(dat, from, to)

  return(dat)
}
