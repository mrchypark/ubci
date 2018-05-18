#' get ubci options
#'
#' get ubci options from source.
#'
#' @param lang language options. Default is en for English. ko is posible for Korean.
#'
#' @export
#' @importFrom httr GET content
#' @importFrom tibble tibble

ubci_get_options <- function(lang = c("en", "ko")) {
  tar <-
    "https://s3.ap-northeast-2.amazonaws.com/crix-production/crix_master"
  dat <- httr::GET(tar) %>%
    httr::content()
  code <- sapply(dat, function(x)
    gsub("CRIX\\.UPBIT\\.", "", x$code))
  if (lang[1] == "en") {
    name <- sapply(dat, function(x)
      x$englishName)
  }

  if (lang[1] == "ko") {
    name <- sapply(dat, function(x)
      x$koreanName)
  }
  exchange <- sapply(dat, function(x)
    x$exchange)
  tradeStatus <- sapply(dat, function(x)
    x$tradeStatus)
  marketState <- sapply(dat, function(x)
    x$marketState)

  dat <-
    tibble::tibble(code, name, exchange, tradeStatus, marketState)
  return(dat)
}
