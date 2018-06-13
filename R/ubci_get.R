#' get coin price
#'
#' get coin price data from source. Source is \href{https://upbit.com/exchange?code=CRIX.UPBIT.KRW-BTC}{here}.
#'
#' @param code coin name fom ubci_get_options() link "UPBIT.KRW-BTC".
#' @param from Optional for various time series.
#'   A character string representing a start date in
#'   YYYY-MM-DD format.
#' @param to Optional for various time series.
#'   A character string representing an end date in
#'   YYYY-MM-DD format.
#'
#' @return Return type is tibble has columes contain code, date, open, high, low, close, volume.
#'
#' @examples
#' \dontrun{
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

ubci_get <- function(code, from, to) {
  . <- NULL
  candleDateTime <- NULL
  openingPrice <- NULL
  highPrice <- NULL
  lowPrice <- NULL
  tradePrice <- NULL
  candleAccTradeVolume <- NULL
  high <- NULL
  low <- NULL
  volume <- NULL
  index <- toupper(gsub("CRIX\\.", "", code))
  tar <-
    paste0(
      "https://crix-api-cdn.upbit.com/v1/crix/candles/days?code=CRIX.",
      code,
      "&count=10000"
    )

  dat <- httr::GET(tar) %>% httr::content()
  if (!is.null(dat$error)) {
    stop(
      paste0(
        dat$message,
        "Please check for sure code is in ubci_get_options(), column code."
      )
    )
  }
  dat <- dat %>%
    do.call(rbind, .) %>%
    data.frame %>%
    dplyr::select(1:8) %>%
    tidyr::unnest() %>%
    tibble::as_tibble() %>%
    dplyr::transmute(
      date = lubridate::ymd(lubridate::ymd_hms(candleDateTime)),
      code = gsub("CRIX\\.", "", code),
      open = openingPrice,
      high = highPrice,
      low = lowPrice,
      close = tradePrice,
      volume = candleAccTradeVolume
    ) %>%
    dplyr::select(code,
                  date,
                  open,
                  high,
                  low,
                  close,
                  volume)
  dat <- period(dat,from,to)

  return(dat)
}
