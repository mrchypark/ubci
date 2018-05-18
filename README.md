
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ubci

[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![Travis build
status](https://travis-ci.org/mrchypark/ubci.svg?branch=master)](https://travis-ci.org/mrchypark/ubci)
[![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/mrchypark/ubci?branch=master&svg=true)](https://ci.appveyor.com/project/mrchypark/ubci)

The goal of ubci is to get UBCI(UpBit Crypto Index) & Crypto price data
form [upbit](https://www.ubcindex.com/home).

## Installation

You can install the development version of ubci from
[GitHub](https://github.com/mrchypark/ubci) with:

``` r
source("https://install-github.me/mrchypark/ubci")
```

please check encoding UTF-8 for unix-like os.

``` r
Sys.getlocale()
#> [1] "ko_KR.UTF-8/ko_KR.UTF-8/ko_KR.UTF-8/C/ko_KR.UTF-8/en_US.UTF-8"
```

## Example

### index options

`ubci_index_options()` function return list of index code &
descriptions.

``` r
library(ubci)
ubci_index_options()
#> # A tibble: 26 x 4
#>    index    name                                cate           smry       
#>    <chr>    <chr>                               <chr>          <chr>      
#>  1 UBMI     UBMI(Upbit Market Index)            Market Indexes It is calc…
#>  2 UBMI_ST  UBMI BTC quote(Upbit Market Index)  Market Indexes It is the …
#>  3 UBAI     UBAI(Upbit Altcoin Index)           Market Indexes It is calc…
#>  4 UBAI_ST  UBAI BTC quote(Upbit Altcoin Index) Market Indexes It is the …
#>  5 UTTI     UBMI 10(Upbit Top 10)               Market Indexes It is an i…
#>  6 UTHI     UBMI 30(Upbit Top 30)               Market Indexes It is an i…
#>  7 THMIDX10 Value Preservation and Basket       Theme Indexes  ""         
#>  8 THMIDX16 Simple Settlement Platform          Theme Indexes  ""         
#>  9 THMIDX05 Game                                Theme Indexes  ""         
#> 10 THMIDX14 Advertisement Industry              Theme Indexes  ""         
#> # ... with 16 more rows
```

`ubci_index_options()` function provide lang param for korean
descriptions.

``` r
ubci_index_options(lang="ko")
#> # A tibble: 26 x 4
#>    index    name                                cate        smry          
#>    <chr>    <chr>                               <chr>       <chr>         
#>  1 UBMI     UBMI(Upbit Market Index)            시장 인덱스 업비트 거래소에 상장된 …
#>  2 UBMI_ST  UBMI BTC quote(Upbit Market Index)  시장 인덱스 UBMI 인덱스를 비트코…
#>  3 UBAI     UBAI(Upbit Altcoin Index)           시장 인덱스 업비트 거래소에 상장된 …
#>  4 UBAI_ST  UBAI BTC quote(Upbit Altcoin Index) 시장 인덱스 UBAI 인덱스를 비트코…
#>  5 UTTI     UBMI 10(Upbit Top 10)               시장 인덱스 업비트에 상장된 암호화폐…
#>  6 UTHI     UBMI 30(Upbit Top 30)               시장 인덱스 업비트에 상장된 암호화폐…
#>  7 THMIDX10 가치보존 및 바스켓                  테마 인덱스 다른 자산으로 구성된 바…
#>  8 THMIDX16 간편결제 플랫폼                     테마 인덱스 온라인 자산과 암호화폐를…
#>  9 THMIDX05 게임시장                            테마 인덱스 게임 산업과 연관되거나,…
#> 10 THMIDX14 광고산업                            테마 인덱스 다양한 형태의 광고와 관…
#> # ... with 16 more rows
```

### index

`ubci_index()` function return index data with code, range of date with
from/to.

``` r
loi<-ubci_index_options()
loi$index[1]
#> [1] "UBMI"
ubci_index(loi$index[1])
#> # A tibble: 230 x 6
#>    index date        open  high   low close
#>    <chr> <date>     <dbl> <dbl> <dbl> <dbl>
#>  1 UBMI  2018-05-18 2199. 2201. 2140. 2174.
#>  2 UBMI  2018-05-17 2281. 2317. 2177. 2200.
#>  3 UBMI  2018-05-16 2319. 2330. 2183. 2281.
#>  4 UBMI  2018-05-15 2419. 2439. 2301. 2317.
#>  5 UBMI  2018-05-14 2431. 2456. 2305. 2417.
#>  6 UBMI  2018-05-13 2313. 2445. 2274. 2430.
#>  7 UBMI  2018-05-12 2206. 2356. 2138. 2313.
#>  8 UBMI  2018-05-11 2446. 2465. 2088. 2239.
#>  9 UBMI  2018-05-10 2598. 2608. 2431. 2446.
#> 10 UBMI  2018-05-09 2549. 2594. 2441. 2583.
#> # ... with 220 more rows
tail(ubci_index(loi$index[1], from="2018-05-15"))
#> # A tibble: 4 x 6
#>   index date        open  high   low close
#>   <chr> <date>     <dbl> <dbl> <dbl> <dbl>
#> 1 UBMI  2018-05-18 2199. 2201. 2140. 2174.
#> 2 UBMI  2018-05-17 2281. 2317. 2177. 2200.
#> 3 UBMI  2018-05-16 2319. 2330. 2183. 2281.
#> 4 UBMI  2018-05-15 2419. 2439. 2301. 2317.
ubci_index(loi$index[1], to="2018-05-15")
#> # A tibble: 227 x 6
#>    index date        open  high   low close
#>    <chr> <date>     <dbl> <dbl> <dbl> <dbl>
#>  1 UBMI  2018-05-15 2419. 2439. 2301. 2317.
#>  2 UBMI  2018-05-14 2431. 2456. 2305. 2417.
#>  3 UBMI  2018-05-13 2313. 2445. 2274. 2430.
#>  4 UBMI  2018-05-12 2206. 2356. 2138. 2313.
#>  5 UBMI  2018-05-11 2446. 2465. 2088. 2239.
#>  6 UBMI  2018-05-10 2598. 2608. 2431. 2446.
#>  7 UBMI  2018-05-09 2549. 2594. 2441. 2583.
#>  8 UBMI  2018-05-08 2618. 2644. 2521. 2567.
#>  9 UBMI  2018-05-07 2700. 2700. 2538. 2612.
#> 10 UBMI  2018-05-06 2699. 2699. 2699. 2699.
#> # ... with 217 more rows
ubci_index(loi$index[1], from="2018-05-10", to="2018-05-15")
#> # A tibble: 6 x 6
#>   index date        open  high   low close
#>   <chr> <date>     <dbl> <dbl> <dbl> <dbl>
#> 1 UBMI  2018-05-15 2419. 2439. 2301. 2317.
#> 2 UBMI  2018-05-14 2431. 2456. 2305. 2417.
#> 3 UBMI  2018-05-13 2313. 2445. 2274. 2430.
#> 4 UBMI  2018-05-12 2206. 2356. 2138. 2313.
#> 5 UBMI  2018-05-11 2446. 2465. 2088. 2239.
#> 6 UBMI  2018-05-10 2598. 2608. 2431. 2446.
```

### crypto price options

`ubci_get_options()` function return list of crypto code & name.

``` r
ubci_get_options()
#> # A tibble: 397 x 5
#>    code      name         exchange tradeStatus marketState
#>    <chr>     <chr>        <chr>    <chr>       <chr>      
#>  1 KRW-BTC   Bitcoin      UPBIT    ACTIVE      ACTIVE     
#>  2 KRW-DASH  Dash         UPBIT    PREVIEW     ACTIVE     
#>  3 KRW-ETH   Ethereum     UPBIT    PREVIEW     ACTIVE     
#>  4 BTC-NEO   NEO          UPBIT    ACTIVE      ACTIVE     
#>  5 BTC-BCC   Bitcoin Cash UPBIT    ACTIVE      ACTIVE     
#>  6 BTC-ETH   Ethereum     UPBIT    ACTIVE      ACTIVE     
#>  7 BTC-MTL   Metal        UPBIT    DELISTED    DELISTED   
#>  8 BTC-LTC   Litecoin     UPBIT    ACTIVE      ACTIVE     
#>  9 BTC-STRAT Stratis      UPBIT    ACTIVE      ACTIVE     
#> 10 BTC-XRP   Ripple       UPBIT    ACTIVE      ACTIVE     
#> # ... with 387 more rows
```

`ubci_get_options()` function provide lang param for korean name of
crypto.

``` r
ubci_get_options(lang="ko")
#> # A tibble: 397 x 5
#>    code      name         exchange tradeStatus marketState
#>    <chr>     <chr>        <chr>    <chr>       <chr>      
#>  1 KRW-BTC   비트코인     UPBIT    ACTIVE      ACTIVE     
#>  2 KRW-DASH  대시         UPBIT    PREVIEW     ACTIVE     
#>  3 KRW-ETH   이더리움     UPBIT    PREVIEW     ACTIVE     
#>  4 BTC-NEO   네오         UPBIT    ACTIVE      ACTIVE     
#>  5 BTC-BCC   비트코인캐시 UPBIT    ACTIVE      ACTIVE     
#>  6 BTC-ETH   이더리움     UPBIT    ACTIVE      ACTIVE     
#>  7 BTC-MTL   메탈         UPBIT    DELISTED    DELISTED   
#>  8 BTC-LTC   라이트코인   UPBIT    ACTIVE      ACTIVE     
#>  9 BTC-STRAT 스트라티스   UPBIT    ACTIVE      ACTIVE     
#> 10 BTC-XRP   리플         UPBIT    ACTIVE      ACTIVE     
#> # ... with 387 more rows
```

### crypto price

`ubci_get()` function return crypto prcie data with code, range of date
with from/to.

``` r
loc<-ubci_get_options()
loc$code[1]
#> [1] "KRW-BTC"
ubci_get(loc$code[1])
#> # A tibble: 236 x 7
#>    index   date            open      high      low     close volume
#>    <chr>   <date>         <dbl>     <dbl>    <dbl>     <dbl>  <dbl>
#>  1 KRW-BTC 2018-05-18  9072000.  9099000. 8881000.  8961000.  2965.
#>  2 KRW-BTC 2018-05-17  9297000.  9390000. 9020000.  9090000.  6922.
#>  3 KRW-BTC 2018-05-16  9500000.  9542000. 9015000.  9297000. 12219.
#>  4 KRW-BTC 2018-05-15  9802000.  9879000. 9458000.  9500000.  8326.
#>  5 KRW-BTC 2018-05-14  9804000.  9935000. 9400000.  9797000. 12813.
#>  6 KRW-BTC 2018-05-13  9480000.  9851000. 9360000.  9803000.  8513.
#>  7 KRW-BTC 2018-05-12  9257000.  9644000. 9014000.  9481000. 10980.
#>  8 KRW-BTC 2018-05-11  9976000.  9985000. 8788000.  9256000. 20998.
#>  9 KRW-BTC 2018-05-10 10405000. 10474000. 9895000.  9976000.  9078.
#> 10 KRW-BTC 2018-05-09 10230000. 10433000. 9917000. 10405000.  9955.
#> # ... with 226 more rows
tail(ubci_get(loc$code[1], from="2018-05-15"))
#> # A tibble: 4 x 7
#>   index   date           open     high      low    close volume
#>   <chr>   <date>        <dbl>    <dbl>    <dbl>    <dbl>  <dbl>
#> 1 KRW-BTC 2018-05-18 9072000. 9099000. 8881000. 8961000.  2965.
#> 2 KRW-BTC 2018-05-17 9297000. 9390000. 9020000. 9090000.  6922.
#> 3 KRW-BTC 2018-05-16 9500000. 9542000. 9015000. 9297000. 12219.
#> 4 KRW-BTC 2018-05-15 9802000. 9879000. 9458000. 9500000.  8326.
ubci_get(loc$code[1], to="2018-05-15")
#> # A tibble: 233 x 7
#>    index   date            open      high       low     close volume
#>    <chr>   <date>         <dbl>     <dbl>     <dbl>     <dbl>  <dbl>
#>  1 KRW-BTC 2018-05-15  9802000.  9879000.  9458000.  9500000.  8326.
#>  2 KRW-BTC 2018-05-14  9804000.  9935000.  9400000.  9797000. 12813.
#>  3 KRW-BTC 2018-05-13  9480000.  9851000.  9360000.  9803000.  8513.
#>  4 KRW-BTC 2018-05-12  9257000.  9644000.  9014000.  9481000. 10980.
#>  5 KRW-BTC 2018-05-11  9976000.  9985000.  8788000.  9256000. 20998.
#>  6 KRW-BTC 2018-05-10 10405000. 10474000.  9895000.  9976000.  9078.
#>  7 KRW-BTC 2018-05-09 10230000. 10433000.  9917000. 10405000.  9955.
#>  8 KRW-BTC 2018-05-08 10439000. 10499000. 10130000. 10233000.  7651.
#>  9 KRW-BTC 2018-05-07 10684000. 10721000. 10264000. 10422000.  8143.
#> 10 KRW-BTC 2018-05-06 10820000. 10963000. 10500000. 10684000.  8806.
#> # ... with 223 more rows
ubci_get(loc$code[1], from="2018-05-10", to="2018-05-15")
#> # A tibble: 6 x 7
#>   index   date            open      high      low    close volume
#>   <chr>   <date>         <dbl>     <dbl>    <dbl>    <dbl>  <dbl>
#> 1 KRW-BTC 2018-05-15  9802000.  9879000. 9458000. 9500000.  8326.
#> 2 KRW-BTC 2018-05-14  9804000.  9935000. 9400000. 9797000. 12813.
#> 3 KRW-BTC 2018-05-13  9480000.  9851000. 9360000. 9803000.  8513.
#> 4 KRW-BTC 2018-05-12  9257000.  9644000. 9014000. 9481000. 10980.
#> 5 KRW-BTC 2018-05-11  9976000.  9985000. 8788000. 9256000. 20998.
#> 6 KRW-BTC 2018-05-10 10405000. 10474000. 9895000. 9976000.  9078.
```

Session info is below.

``` r
sessionInfo()
#> R version 3.4.4 (2018-03-15)
#> Platform: x86_64-apple-darwin15.6.0 (64-bit)
#> Running under: macOS High Sierra 10.13.4
#> 
#> Matrix products: default
#> BLAS: /Library/Frameworks/R.framework/Versions/3.4/Resources/lib/libRblas.0.dylib
#> LAPACK: /Library/Frameworks/R.framework/Versions/3.4/Resources/lib/libRlapack.dylib
#> 
#> locale:
#> [1] ko_KR.UTF-8/ko_KR.UTF-8/ko_KR.UTF-8/C/ko_KR.UTF-8/en_US.UTF-8
#> 
#> attached base packages:
#> [1] stats     graphics  grDevices utils     datasets  methods   base     
#> 
#> other attached packages:
#> [1] bindrcpp_0.2.2 ubci_0.0.1    
#> 
#> loaded via a namespace (and not attached):
#>  [1] Rcpp_0.12.16     knitr_1.20       bindr_0.1.1      magrittr_1.5    
#>  [5] tidyselect_0.2.4 R6_2.2.2         rlang_0.2.0      stringr_1.3.0   
#>  [9] httr_1.3.1       dplyr_0.7.5.9000 tools_3.4.4      utf8_1.1.3      
#> [13] cli_1.0.0        htmltools_0.3.6  yaml_2.1.18      rprojroot_1.3-2 
#> [17] digest_0.6.15    assertthat_0.2.0 tibble_1.4.2     crayon_1.3.4    
#> [21] tidyr_0.8.0      purrr_0.2.4      curl_3.2         glue_1.2.0      
#> [25] evaluate_0.10.1  rmarkdown_1.9    stringi_1.1.7    compiler_3.4.4  
#> [29] pillar_1.2.1     backports_1.1.2  jsonlite_1.5     lubridate_1.7.4 
#> [33] pkgconfig_2.0.1
```

Data source license is below.

    “UBCI 인덱스”
    Copyright 2018 두나무(주) All rights reserved.
    Powered by 두나무/Upbit

Please note that this project is released with a [Contributor Code of
Conduct](CODE_OF_CONDUCT.md). By participating in this project you agree
to abide by its terms.
