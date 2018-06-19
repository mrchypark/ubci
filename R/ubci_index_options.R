#' get ubci index options
#'
#' get ubci index options from source.
#'
#' @param lang language options. Default is en for English. ko is posible for Korean.
#'
#' @examples
#' \donttest{
#' ubci_index_options()
#' ubci_index_options("ko")
#' }
#'
#' @export
#' @importFrom httr GET content
#' @importFrom tibble as_tibble
#' @importFrom dplyr bind_rows


ubci_index_options <- function(lang = c("en", "ko")) {
  tar <-
    paste0(
      "https://ubci-content-manager.ubcindex.com/api/v1/ubci/configs/category?locale=",
      lang[1]
    )
  dat <-
    tar %>%
    httr::GET() %>%
    httr::content()

  dat1 <- get_data(dat, 1)
  dat2 <- get_data(dat, 2)
  dat3 <- get_data(dat, 3)

  dat <- dplyr::bind_rows(dat1, dat2, dat3)

  dat <- tibble::as_tibble(dat)

  return(dat)
}

get_data <- function(dat, i) {
  cate <- trimws(dat$data$categories[[i]]$heading_name)
  index <-
    sapply(dat$data$categories[[i]]$baskets, function(x)
      gsub("IDX\\.UPBIT\\.","",x$code))
  name <-
    sapply(dat$data$categories[[i]]$baskets, function(x)
      trimws(x$name))
  hdnm <-
    sapply(dat$data$categories[[i]]$baskets, function(x)
      trimws(x$heading_name))
  if (any(hdnm != "")) {
    name <- paste0(name, "(", hdnm, ")")
  }
  smry <-
    sapply(dat$data$categories[[i]]$baskets, function(x)
      trimws(x$summary))
  return(data.frame(index, name, cate, smry, stringsAsFactors = F))
}
