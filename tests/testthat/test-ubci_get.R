context("test-ubci_get.R")

test_that("colume check", {
  tem <- ubci_get("UPBIT.KRW-BTC")
  col <- c("code","date","open","high","low","close","volume")
  expect_equal(names(tem), col)
})

test_that("code check", {
  expect<-ubci_get_options()$code[1]
  tem <- ubci_get(expect)
  code <- unique(tem$code)
  expect_equal(code, expect)
})

test_that("date check from", {
  chk <- tail(ubci_get("UPBIT.KRW-BTC", from = Sys.Date()-5),1)$date
  expect_equal(chk, Sys.Date()-5)
})

test_that("date check to", {
  chk <- head(ubci_get("UPBIT.KRW-BTC", to = Sys.Date()-2),1)$date
  expect_equal(chk, Sys.Date()-2)
})

