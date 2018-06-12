
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ubci

[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![License:
MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Travis build
status](https://travis-ci.org/mrchypark/ubci.svg?branch=master)](https://travis-ci.org/mrchypark/ubci)
[![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/mrchypark/ubci?branch=master&svg=true)](https://ci.appveyor.com/project/mrchypark/ubci)
[![Coverage
status](https://codecov.io/gh/mrchypark/ubci/branch/master/graph/badge.svg)](https://codecov.io/github/mrchypark/ubci?branch=master)
[![CRAN
status](https://www.r-pkg.org/badges/version/ubci)](https://cran.r-project.org/package=ubci)

The goal of ubci is to get UBCI(UpBit Crypto Index) & Crypto price data
form [upbit](https://www.ubcindex.com/home).

  - *notice* : This is a personal project and not relevant to upbit.

## Installation

You can install the development version of ubci from
[GitHub](https://github.com/mrchypark/ubci) with:

``` r
source("https://install-github.me/mrchypark/ubci")
```

please check encoding UTF-8 for unix-like os.

``` r
Sys.getlocale()
#> [1] "LC_COLLATE=Korean_Korea.949;LC_CTYPE=Korean_Korea.949;LC_MONETARY=Korean_Korea.949;LC_NUMERIC=C;LC_TIME=Korean_Korea.949"
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
#>  1 UBMI     UBMI(Upbit Market Index)            Market Indexes It is calc~
#>  2 UBMI_ST  UBMI BTC quote(Upbit Market Index)  Market Indexes It is the ~
#>  3 UBAI     UBAI(Upbit Altcoin Index)           Market Indexes It is calc~
#>  4 UBAI_ST  UBAI BTC quote(Upbit Altcoin Index) Market Indexes It is the ~
#>  5 UTTI     UBMI 10(Upbit Top 10)               Market Indexes It is an i~
#>  6 UTHI     UBMI 30(Upbit Top 30)               Market Indexes It is an i~
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
#>  1 UBMI     UBMI(Upbit Market Index)            시장 인덱스 업비트 거래소에 상장된 ~
#>  2 UBMI_ST  UBMI BTC quote(Upbit Market Index)  시장 인덱스 UBMI 인덱스를 비트코~
#>  3 UBAI     UBAI(Upbit Altcoin Index)           시장 인덱스 업비트 거래소에 상장된 ~
#>  4 UBAI_ST  UBAI BTC quote(Upbit Altcoin Index) 시장 인덱스 UBAI 인덱스를 비트코~
#>  5 UTTI     UBMI 10(Upbit Top 10)               시장 인덱스 업비트에 상장된 암호화폐~
#>  6 UTHI     UBMI 30(Upbit Top 30)               시장 인덱스 업비트에 상장된 암호화폐~
#>  7 THMIDX10 가치보존 및 바스켓                  테마 인덱스 다른 자산으로 구성된 바~
#>  8 THMIDX16 간편결제 플랫폼                     테마 인덱스 온라인 자산과 암호화폐를~
#>  9 THMIDX05 게임시장                            테마 인덱스 게임 산업과 연관되거나,~
#> 10 THMIDX14 광고산업                            테마 인덱스 다양한 형태의 광고와 관~
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
#> # A tibble: 255 x 6
#>    index date        open  high   low close
#>    <chr> <date>     <dbl> <dbl> <dbl> <dbl>
#>  1 UBMI  2018-06-12 1796. 1810. 1741. 1757.
#>  2 UBMI  2018-06-11 1780. 1800. 1718. 1795.
#>  3 UBMI  2018-06-10 1970. 1970. 1722. 1779.
#>  4 UBMI  2018-06-09 1996. 2011. 1967. 1969.
#>  5 UBMI  2018-06-08 2011. 2012. 1975. 1995.
#>  6 UBMI  2018-06-07 2010. 2034. 1998. 2009.
#>  7 UBMI  2018-06-06 2021. 2025. 1974. 2010.
#>  8 UBMI  2018-06-05 1983. 2036. 1938. 2021.
#>  9 UBMI  2018-06-04 2050. 2073. 1960. 1983.
#> 10 UBMI  2018-06-03 1992. 2054. 1986. 2049.
#> # ... with 245 more rows
tail(ubci_index(loi$index[1], from="2018-05-15"))
#> # A tibble: 6 x 6
#>   index date        open  high   low close
#>   <chr> <date>     <dbl> <dbl> <dbl> <dbl>
#> 1 UBMI  2018-05-20 2216. 2300. 2198. 2290.
#> 2 UBMI  2018-05-19 2231. 2255. 2197. 2215.
#> 3 UBMI  2018-05-18 2199. 2232. 2140. 2229.
#> 4 UBMI  2018-05-17 2281. 2317. 2177. 2200.
#> 5 UBMI  2018-05-16 2319. 2330. 2183. 2281.
#> 6 UBMI  2018-05-15 2419. 2439. 2301. 2317.
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
#> # A tibble: 409 x 5
#>    code            name         exchange tradeStatus marketState
#>    <chr>           <chr>        <chr>    <chr>       <chr>      
#>  1 UPBIT.KRW-BTC   Bitcoin      UPBIT    ACTIVE      ACTIVE     
#>  2 UPBIT.KRW-DASH  Dash         UPBIT    PREVIEW     ACTIVE     
#>  3 UPBIT.KRW-ETH   Ethereum     UPBIT    PREVIEW     ACTIVE     
#>  4 UPBIT.BTC-NEO   NEO          UPBIT    ACTIVE      ACTIVE     
#>  5 UPBIT.BTC-BCC   Bitcoin Cash UPBIT    ACTIVE      ACTIVE     
#>  6 UPBIT.BTC-ETH   Ethereum     UPBIT    ACTIVE      ACTIVE     
#>  7 UPBIT.BTC-MTL   Metal        UPBIT    DELISTED    DELISTED   
#>  8 UPBIT.BTC-LTC   Litecoin     UPBIT    ACTIVE      ACTIVE     
#>  9 UPBIT.BTC-STRAT Stratis      UPBIT    ACTIVE      ACTIVE     
#> 10 UPBIT.BTC-XRP   Ripple       UPBIT    ACTIVE      ACTIVE     
#> # ... with 399 more rows
```

`ubci_get_options()` function provide lang param for korean name of
crypto.

``` r
ubci_get_options(lang="ko")
#> # A tibble: 409 x 5
#>    code            name         exchange tradeStatus marketState
#>    <chr>           <chr>        <chr>    <chr>       <chr>      
#>  1 UPBIT.KRW-BTC   비트코인     UPBIT    ACTIVE      ACTIVE     
#>  2 UPBIT.KRW-DASH  대시         UPBIT    PREVIEW     ACTIVE     
#>  3 UPBIT.KRW-ETH   이더리움     UPBIT    PREVIEW     ACTIVE     
#>  4 UPBIT.BTC-NEO   네오         UPBIT    ACTIVE      ACTIVE     
#>  5 UPBIT.BTC-BCC   비트코인캐시 UPBIT    ACTIVE      ACTIVE     
#>  6 UPBIT.BTC-ETH   이더리움     UPBIT    ACTIVE      ACTIVE     
#>  7 UPBIT.BTC-MTL   메탈         UPBIT    DELISTED    DELISTED   
#>  8 UPBIT.BTC-LTC   라이트코인   UPBIT    ACTIVE      ACTIVE     
#>  9 UPBIT.BTC-STRAT 스트라티스   UPBIT    ACTIVE      ACTIVE     
#> 10 UPBIT.BTC-XRP   리플         UPBIT    ACTIVE      ACTIVE     
#> # ... with 399 more rows
```

### crypto price

`ubci_get()` function return crypto prcie data with code, range of date
with from/to.

``` r
loc<-ubci_get_options()
loc$code[1]
#> [1] "UPBIT.KRW-BTC"
ubci_get(loc$code[1])
#> # A tibble: 261 x 7
#>    code          date           open     high      low    close volume
#>    <chr>         <date>        <dbl>    <dbl>    <dbl>    <dbl>  <dbl>
#>  1 UPBIT.KRW-BTC 2018-06-12 7635000. 7685000. 7440000. 7510000.  3403.
#>  2 UPBIT.KRW-BTC 2018-06-11 7576000. 7662000. 7362000. 7635000.  4309.
#>  3 UPBIT.KRW-BTC 2018-06-10 8233000. 8247000. 7425000. 7576000.  7445.
#>  4 UPBIT.KRW-BTC 2018-06-09 8341000. 8370000. 8205000. 8233000.  1658.
#>  5 UPBIT.KRW-BTC 2018-06-08 8375000. 8385000. 8268000. 8341000.  2686.
#>  6 UPBIT.KRW-BTC 2018-06-07 8358000. 8490000. 8330000. 8375000.  3432.
#>  7 UPBIT.KRW-BTC 2018-06-06 8359000. 8400000. 8208000. 8359000.  3334.
#>  8 UPBIT.KRW-BTC 2018-06-05 8241000. 8400000. 8130000. 8360000.  3715.
#>  9 UPBIT.KRW-BTC 2018-06-04 8419000. 8477000. 8206000. 8248000.  3616.
#> 10 UPBIT.KRW-BTC 2018-06-03 8338000. 8443000. 8297000. 8419000.  3756.
#> # ... with 251 more rows
tail(ubci_get(loc$code[1], from="2018-05-15"))
#> # A tibble: 6 x 7
#>   code          date           open     high      low    close volume
#>   <chr>         <date>        <dbl>    <dbl>    <dbl>    <dbl>  <dbl>
#> 1 UPBIT.KRW-BTC 2018-05-20 9112000. 9398000. 9051000. 9370000.  4901.
#> 2 UPBIT.KRW-BTC 2018-05-19 9165000. 9299000. 9068000. 9112000.  6285.
#> 3 UPBIT.KRW-BTC 2018-05-18 9072000. 9186000. 8881000. 9165000.  5904.
#> 4 UPBIT.KRW-BTC 2018-05-17 9297000. 9390000. 9020000. 9090000.  6922.
#> 5 UPBIT.KRW-BTC 2018-05-16 9500000. 9542000. 9015000. 9297000. 12219.
#> 6 UPBIT.KRW-BTC 2018-05-15 9802000. 9879000. 9458000. 9500000.  8326.
ubci_get(loc$code[1], to="2018-05-15")
#> # A tibble: 233 x 7
#>    code          date            open      high       low     close volume
#>    <chr>         <date>         <dbl>     <dbl>     <dbl>     <dbl>  <dbl>
#>  1 UPBIT.KRW-BTC 2018-05-15  9802000.  9879000.  9458000.  9500000.  8326.
#>  2 UPBIT.KRW-BTC 2018-05-14  9804000.  9935000.  9400000.  9797000. 12813.
#>  3 UPBIT.KRW-BTC 2018-05-13  9480000.  9851000.  9360000.  9803000.  8513.
#>  4 UPBIT.KRW-BTC 2018-05-12  9257000.  9644000.  9014000.  9481000. 10980.
#>  5 UPBIT.KRW-BTC 2018-05-11  9976000.  9985000.  8788000.  9256000. 20998.
#>  6 UPBIT.KRW-BTC 2018-05-10 10405000. 10474000.  9895000.  9976000.  9078.
#>  7 UPBIT.KRW-BTC 2018-05-09 10230000. 10433000.  9917000. 10405000.  9955.
#>  8 UPBIT.KRW-BTC 2018-05-08 10439000. 10499000. 10130000. 10233000.  7651.
#>  9 UPBIT.KRW-BTC 2018-05-07 10684000. 10721000. 10264000. 10422000.  8143.
#> 10 UPBIT.KRW-BTC 2018-05-06 10820000. 10963000. 10500000. 10684000.  8806.
#> # ... with 223 more rows
ubci_get(loc$code[1], from="2018-05-10", to="2018-05-15")
#> # A tibble: 6 x 7
#>   code          date            open      high      low    close volume
#>   <chr>         <date>         <dbl>     <dbl>    <dbl>    <dbl>  <dbl>
#> 1 UPBIT.KRW-BTC 2018-05-15  9802000.  9879000. 9458000. 9500000.  8326.
#> 2 UPBIT.KRW-BTC 2018-05-14  9804000.  9935000. 9400000. 9797000. 12813.
#> 3 UPBIT.KRW-BTC 2018-05-13  9480000.  9851000. 9360000. 9803000.  8513.
#> 4 UPBIT.KRW-BTC 2018-05-12  9257000.  9644000. 9014000. 9481000. 10980.
#> 5 UPBIT.KRW-BTC 2018-05-11  9976000.  9985000. 8788000. 9256000. 20998.
#> 6 UPBIT.KRW-BTC 2018-05-10 10405000. 10474000. 9895000. 9976000.  9078.
```

Session info is below.

``` r
sessionInfo()
#> R version 3.4.4 (2018-03-15)
#> Platform: x86_64-w64-mingw32/x64 (64-bit)
#> Running under: Windows 10 x64 (build 17134)
#> 
#> Matrix products: default
#> 
#> locale:
#> [1] LC_COLLATE=Korean_Korea.949  LC_CTYPE=Korean_Korea.949   
#> [3] LC_MONETARY=Korean_Korea.949 LC_NUMERIC=C                
#> [5] LC_TIME=Korean_Korea.949    
#> 
#> attached base packages:
#> [1] stats     graphics  grDevices utils     datasets  methods   base     
#> 
#> other attached packages:
#> [1] bindrcpp_0.2.2       ubci_0.0.1           RevoUtils_10.0.9    
#> [4] RevoUtilsMath_10.0.1
#> 
#> loaded via a namespace (and not attached):
#>  [1] Rcpp_0.12.16     knitr_1.20       bindr_0.1.1      magrittr_1.5    
#>  [5] tidyselect_0.2.4 R6_2.2.2         rlang_0.2.0      stringr_1.3.0   
#>  [9] httr_1.3.1       dplyr_0.7.4      tools_3.4.4      utf8_1.1.3      
#> [13] cli_1.0.0        htmltools_0.3.6  yaml_2.1.18      rprojroot_1.3-2 
#> [17] digest_0.6.15    assertthat_0.2.0 tibble_1.4.2     crayon_1.3.4    
#> [21] purrr_0.2.4      tidyr_0.8.0      curl_3.2         glue_1.2.0.9000 
#> [25] evaluate_0.10.1  rmarkdown_1.9    stringi_1.1.7    compiler_3.4.4  
#> [29] pillar_1.2.1     backports_1.1.2  jsonlite_1.5     lubridate_1.7.2 
#> [33] pkgconfig_2.0.1
```

Data source license is below.

    “UBCI 인덱스”
    Copyright 2018 두나무(주) All rights reserved.
    Powered by 두나무/Upbit

Please note that this project is released with a [Contributor Code of
Conduct](CODE_OF_CONDUCT.md). By participating in this project you agree
to abide by its terms.
