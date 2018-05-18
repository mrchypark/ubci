## to-do
ubci_index_info <- function(index) {
  index <- toupper(gsub("IDX\\.UPBIT\\.","",index))
  tar <- paste0("https://crix-api-cdn.upbit.com/v1/crix/index/baskets?code=IDX.UPBIT.",index)
  tar_ew<-paste0("https://crix-api-cdn.upbit.com/v1/crix/index/baskets?code=IDX.UPBIT.",index,"_EW")

  GET(tar) %>% content
  GET(tar_ew) %>% content

  return("hi")
}
