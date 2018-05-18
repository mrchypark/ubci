#' get coin price
#'
#' get coin price data from source.
#'
#' @param index coin name fom ubci_get_options() link KRW-BTC.
#' @param from Optional for various time series.
#'   A character string representing a start date in
#'   YYYY-MM-DD format.
#' @param to Optional for various time series.
#'   A character string representing an end date in
#'   YYYY-MM-DD format.
#'
#' @export
#' @importFrom httr GET content
#' @importFrom tidyr unnest
#' @importFrom tibble as_tibble
#' @importFrom lubridate ymd_hms ymd
#' @importFrom dplyr mutate

ubci_get <- function(index, from, to) {
  index <- toupper(gsub("CRIX\\.UPBIT\\.", "", index))
  tar <-
    paste0(
      "https://crix-api-cdn.upbit.com/v1/crix/candles/days?code=CRIX.UPBIT.",
      index,
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
      index = toupper(gsub("CRIX\\.UPBIT\\.", "", code)),
      open = openingPrice,
      high = highPrice,
      low = lowPrice,
      close = tradePrice,
      volume = candleAccTradeVolume
    ) %>%
    dplyr::select(index,
                  date,
                  open,
                  high,
                  low,
                  close,
                  volume)
  dat <- period(dat,from,to)

  return(dat)
}
