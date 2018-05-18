period <- function(dat, from, to) {
  if (missing(from)) {
    from <- lubridate::ymd("2000-01-01")
  } else {
    from <- lubridate::ymd(from)
  }
  if (missing(to)) {
    to <- lubridate::ymd("3000-01-01")
  } else {
    to <- lubridate::ymd(to)
  }
  dat <- dat %>%
    dplyr::filter(date >= from & date <= to)
  return(dat)
}
