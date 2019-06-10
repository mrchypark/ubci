
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
[![CRAN
download](http://cranlogs.r-pkg.org/badges/grand-total/ubci)](http://cranlogs.r-pkg.org/badges/grand-total/Rcpp)

The goal of ubci is to get UBCI(UpBit Crypto Index) & Crypto price data
form [upbit](https://www.ubcindex.com/home).

  - *notice* : This is a personal project and not relevant to upbit.

## Installation

ubci is now on cran\!

You can install on cran with:

    install.packages("ubci")

You can install the development version of ubci from
[GitHub](https://github.com/mrchypark/ubci) with:

    install.packages("remotes")
    remotes::install_github("mrchypark/ubci")

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
#>    index   name               cate      smry                               
#>    <chr>   <chr>              <chr>     <chr>                              
#>  1 UBMI    UBMI(Upbit Market~ Market I~ It is calculated for all cryptocur~
#>  2 UBMI_ST UBMI BTC quote(Up~ Market I~ It is the index that is converted ~
#>  3 UBAI    UBAI(Upbit Altcoi~ Market I~ It is calculated for all cryptocur~
#>  4 UBAI_ST UBAI BTC quote(Up~ Market I~ It is the index that is converted ~
#>  5 UTTI    UBMI 10(Upbit Top~ Market I~ It is an index that comprises the ~
#>  6 UTHI    UBMI 30(Upbit Top~ Market I~ It is an index that comprises the ~
#>  7 THMIDX~ Value Preservatio~ Theme In~ ""                                 
#>  8 THMIDX~ Simple Settlement~ Theme In~ ""                                 
#>  9 THMIDX~ Game               Theme In~ ""                                 
#> 10 THMIDX~ Advertisement Ind~ Theme In~ ""                                 
#> # ... with 16 more rows
```

`ubci_index_options()` function provide lang param for korean
descriptions.

``` r
ubci_index_options(lang="ko")
#> # A tibble: 26 x 4
#>    index   name                cate     smry                               
#>    <chr>   <chr>               <chr>    <chr>                              
#>  1 UBMI    UBMI(Upbit Market ~ 시장 인덱스~ 업비트 거래소에 상장된 모든 암호화폐를 대상으로 산출한 인덱스~
#>  2 UBMI_ST UBMI BTC quote(Upb~ 시장 인덱스~ UBMI 인덱스를 비트코인 기준으로 환산한 인덱스~
#>  3 UBAI    UBAI(Upbit Altcoin~ 시장 인덱스~ 업비트 거래소에 상장된 모든 암호화폐에서 비트코인을 제외한 인~
#>  4 UBAI_ST UBAI BTC quote(Upb~ 시장 인덱스~ UBAI 인덱스를 비트코인 기준으로 환산한 인덱스~
#>  5 UTTI    UBMI 10(Upbit Top ~ 시장 인덱스~ 업비트에 상장된 암호화폐 중, 시가총액 상위 10개 종목으로 ~
#>  6 UTHI    UBMI 30(Upbit Top ~ 시장 인덱스~ 업비트에 상장된 암호화폐 중, 시가총액 상위 30개 종목으로 ~
#>  7 THMIDX~ 가치보존 및 바스켓  테마 인덱스~ 다른 자산으로 구성된 바스켓을 보유하고 있거나, 연동을 통해 ~
#>  8 THMIDX~ 간편결제 플랫폼     테마 인덱스~ 온라인 자산과 암호화폐를 기반으로 한 결제 솔루션을 제공하는 ~
#>  9 THMIDX~ 게임시장            테마 인덱스~ 게임 산업과 연관되거나, 게임 내/게임 간의 가치 교환에 사용~
#> 10 THMIDX~ 광고산업            테마 인덱스~ 다양한 형태의 광고와 관련된 서비스를 제공하는 암호화폐로 구성~
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
#> # A tibble: 400 x 6
#>    index date        open  high   low close
#>    <chr> <date>     <dbl> <dbl> <dbl> <dbl>
#>  1 UBMI  2019-06-10 1607. 1664. 1574. 1646.
#>  2 UBMI  2019-06-09 1660. 1666. 1588. 1606.
#>  3 UBMI  2019-06-08 1668. 1680. 1636. 1658.
#>  4 UBMI  2019-06-07 1629. 1682. 1608. 1667.
#>  5 UBMI  2019-06-06 1634. 1644. 1565. 1627.
#>  6 UBMI  2019-06-05 1620. 1670. 1586. 1634.
#>  7 UBMI  2019-06-04 1694. 1706. 1571. 1618.
#>  8 UBMI  2019-06-03 1782. 1790. 1696. 1696.
#>  9 UBMI  2019-06-02 1753. 1796. 1751. 1781.
#> 10 UBMI  2019-06-01 1770. 1776. 1737. 1753.
#> # ... with 390 more rows
tail(ubci_index(loi$index[1], from="2019-05-15"))
#> # A tibble: 6 x 6
#>   index date        open  high   low close
#>   <chr> <date>     <dbl> <dbl> <dbl> <dbl>
#> 1 UBMI  2019-05-20 1621. 1621. 1530. 1594.
#> 2 UBMI  2019-05-19 1479. 1638. 1478. 1621.
#> 3 UBMI  2019-05-18 1504. 1552. 1464. 1480.
#> 4 UBMI  2019-05-17 1602. 1622. 1404. 1503.
#> 5 UBMI  2019-05-16 1612. 1684. 1541. 1602.
#> 6 UBMI  2019-05-15 1541. 1623. 1514. 1612.
ubci_index(loi$index[1], to="2019-05-15")
#> # A tibble: 374 x 6
#>    index date        open  high   low close
#>    <chr> <date>     <dbl> <dbl> <dbl> <dbl>
#>  1 UBMI  2019-05-15 1541. 1623. 1514. 1612.
#>  2 UBMI  2019-05-14 1450. 1576. 1443. 1540.
#>  3 UBMI  2019-05-13 1316. 1490. 1303. 1450.
#>  4 UBMI  2019-05-12 1347. 1413. 1282. 1316.
#>  5 UBMI  2019-05-11 1213. 1388. 1213. 1348.
#>  6 UBMI  2019-05-10 1183. 1224. 1173. 1214.
#>  7 UBMI  2019-05-09 1150. 1187. 1150. 1183.
#>  8 UBMI  2019-05-08 1124. 1153. 1111. 1151.
#>  9 UBMI  2019-05-07 1118. 1159. 1118. 1124.
#> 10 UBMI  2019-05-06 1121. 1128. 1098. 1117.
#> # ... with 364 more rows
ubci_index(loi$index[1], from="2019-05-10", to="2019-05-15")
#> # A tibble: 6 x 6
#>   index date        open  high   low close
#>   <chr> <date>     <dbl> <dbl> <dbl> <dbl>
#> 1 UBMI  2019-05-15 1541. 1623. 1514. 1612.
#> 2 UBMI  2019-05-14 1450. 1576. 1443. 1540.
#> 3 UBMI  2019-05-13 1316. 1490. 1303. 1450.
#> 4 UBMI  2019-05-12 1347. 1413. 1282. 1316.
#> 5 UBMI  2019-05-11 1213. 1388. 1213. 1348.
#> 6 UBMI  2019-05-10 1183. 1224. 1173. 1214.
```

### crypto price options

`ubci_get_options()` function return list of crypto code & name.

``` r
ubci_get_options()
#> # A tibble: 513 x 5
#>    code            name             exchange tradeStatus marketState
#>    <chr>           <chr>            <chr>    <chr>       <chr>      
#>  1 UPBIT.KRW-BTC   Bitcoin          UPBIT    ACTIVE      ACTIVE     
#>  2 UPBIT.KRW-DASH  Dash             UPBIT    PREVIEW     ACTIVE     
#>  3 UPBIT.KRW-ETH   Ethereum         UPBIT    PREVIEW     ACTIVE     
#>  4 UPBIT.BTC-NEO   NEO              UPBIT    DELISTED    DELISTED   
#>  5 UPBIT.BTC-ETH   Ethereum         UPBIT    ACTIVE      ACTIVE     
#>  6 UPBIT.BTC-LTC   Litecoin         UPBIT    ACTIVE      ACTIVE     
#>  7 UPBIT.BTC-STRAT Stratis          UPBIT    ACTIVE      ACTIVE     
#>  8 UPBIT.BTC-XRP   Ripple           UPBIT    ACTIVE      ACTIVE     
#>  9 UPBIT.BTC-ETC   Ethereum Classic UPBIT    ACTIVE      ACTIVE     
#> 10 UPBIT.BTC-OMG   OmiseGo          UPBIT    ACTIVE      ACTIVE     
#> # ... with 503 more rows
```

`ubci_get_options()` function provide lang param for korean name of
crypto.

``` r
ubci_get_options(lang="ko")
#> # A tibble: 513 x 5
#>    code            name           exchange tradeStatus marketState
#>    <chr>           <chr>          <chr>    <chr>       <chr>      
#>  1 UPBIT.KRW-BTC   비트코인       UPBIT    ACTIVE      ACTIVE     
#>  2 UPBIT.KRW-DASH  대시           UPBIT    PREVIEW     ACTIVE     
#>  3 UPBIT.KRW-ETH   이더리움       UPBIT    PREVIEW     ACTIVE     
#>  4 UPBIT.BTC-NEO   네오           UPBIT    DELISTED    DELISTED   
#>  5 UPBIT.BTC-ETH   이더리움       UPBIT    ACTIVE      ACTIVE     
#>  6 UPBIT.BTC-LTC   라이트코인     UPBIT    ACTIVE      ACTIVE     
#>  7 UPBIT.BTC-STRAT 스트라티스     UPBIT    ACTIVE      ACTIVE     
#>  8 UPBIT.BTC-XRP   리플           UPBIT    ACTIVE      ACTIVE     
#>  9 UPBIT.BTC-ETC   이더리움클래식 UPBIT    ACTIVE      ACTIVE     
#> 10 UPBIT.BTC-OMG   오미세고       UPBIT    ACTIVE      ACTIVE     
#> # ... with 503 more rows
```

### crypto price

`ubci_get()` function return crypto prcie data with code, range of date
with from/to.

``` r
loc<-ubci_get_options()
loc$code[1]
#> [1] "UPBIT.KRW-BTC"
ubci_get(loc$code[1])
#> # A tibble: 400 x 7
#>    code          date           open     high      low    close volume
#>    <chr>         <date>        <dbl>    <dbl>    <dbl>    <dbl>  <dbl>
#>  1 UPBIT.KRW-BTC 2019-06-10  9477000  9789000  9284000  9673000  6076.
#>  2 UPBIT.KRW-BTC 2019-06-09  9745000  9784000  9381000  9474000  5373.
#>  3 UPBIT.KRW-BTC 2019-06-08  9751000  9825000  9601000  9733000  4780.
#>  4 UPBIT.KRW-BTC 2019-06-07  9495000  9830000  9388000  9749000  7876.
#>  5 UPBIT.KRW-BTC 2019-06-06  9583000  9644000  9172000  9495000  6690.
#>  6 UPBIT.KRW-BTC 2019-06-05  9487000  9826000  9326000  9583000 11686.
#>  7 UPBIT.KRW-BTC 2019-06-04  9999000 10017000  9230000  9486000 13615.
#>  8 UPBIT.KRW-BTC 2019-06-03 10505000 10509000  9990000  9999000  8906.
#>  9 UPBIT.KRW-BTC 2019-06-02 10350000 10599000 10340000 10505000  6869.
#> 10 UPBIT.KRW-BTC 2019-06-01 10383000 10400000 10228000 10350000  5515.
#> # ... with 390 more rows
tail(ubci_get(loc$code[1], from="2019-05-15"))
#> # A tibble: 6 x 7
#>   code          date          open    high     low   close volume
#>   <chr>         <date>       <dbl>   <dbl>   <dbl>   <dbl>  <dbl>
#> 1 UPBIT.KRW-BTC 2019-05-20 9712000 9713000 9200000 9581000 11458.
#> 2 UPBIT.KRW-BTC 2019-05-19 8819000 9809000 8810000 9712000 16388.
#> 3 UPBIT.KRW-BTC 2019-05-18 8891000 9232000 8684000 8823000 11615.
#> 4 UPBIT.KRW-BTC 2019-05-17 9465000 9557000 8360000 8891000 22071.
#> 5 UPBIT.KRW-BTC 2019-05-16 9606000 9842000 9247000 9465000 17057.
#> 6 UPBIT.KRW-BTC 2019-05-15 9499000 9757000 9220000 9606000 17857.
ubci_get(loc$code[1], to="2019-05-15")
#> # A tibble: 374 x 7
#>    code          date          open    high     low   close volume
#>    <chr>         <date>       <dbl>   <dbl>   <dbl>   <dbl>  <dbl>
#>  1 UPBIT.KRW-BTC 2019-05-15 9499000 9757000 9220000 9606000 17857.
#>  2 UPBIT.KRW-BTC 2019-05-14 9235000 9907000 9100000 9499000 25056.
#>  3 UPBIT.KRW-BTC 2019-05-13 8166000 9518000 8064000 9230000 26619.
#>  4 UPBIT.KRW-BTC 2019-05-12 8370000 8807000 7950000 8170000 21060.
#>  5 UPBIT.KRW-BTC 2019-05-11 7495000 8551000 7491000 8368000 24016.
#>  6 UPBIT.KRW-BTC 2019-05-10 7272000 7588000 7228000 7495000 10597.
#>  7 UPBIT.KRW-BTC 2019-05-09 6952000 7299000 6943000 7273000  9562.
#>  8 UPBIT.KRW-BTC 2019-05-08 6752000 6959000 6670000 6959000  5646.
#>  9 UPBIT.KRW-BTC 2019-05-07 6620000 6930000 6618000 6753000  7376.
#> 10 UPBIT.KRW-BTC 2019-05-06 6703000 6712000 6573000 6620000  3957.
#> # ... with 364 more rows
ubci_get(loc$code[1], from="2019-05-10", to="2019-05-15")
#> # A tibble: 6 x 7
#>   code          date          open    high     low   close volume
#>   <chr>         <date>       <dbl>   <dbl>   <dbl>   <dbl>  <dbl>
#> 1 UPBIT.KRW-BTC 2019-05-15 9499000 9757000 9220000 9606000 17857.
#> 2 UPBIT.KRW-BTC 2019-05-14 9235000 9907000 9100000 9499000 25056.
#> 3 UPBIT.KRW-BTC 2019-05-13 8166000 9518000 8064000 9230000 26619.
#> 4 UPBIT.KRW-BTC 2019-05-12 8370000 8807000 7950000 8170000 21060.
#> 5 UPBIT.KRW-BTC 2019-05-11 7495000 8551000 7491000 8368000 24016.
#> 6 UPBIT.KRW-BTC 2019-05-10 7272000 7588000 7228000 7495000 10597.
```

Session info is below.

``` r
sessionInfo()
#> R version 3.5.3 (2019-03-11)
#> Platform: x86_64-w64-mingw32/x64 (64-bit)
#> Running under: Windows 10 x64 (build 18362)
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
#> [1] ubci_0.0.3
#> 
#> loaded via a namespace (and not attached):
#>  [1] Rcpp_1.0.1       knitr_1.23       magrittr_1.5     tidyselect_0.2.5
#>  [5] R6_2.4.0         rlang_0.3.4      fansi_0.4.0      stringr_1.4.0   
#>  [9] httr_1.4.0       dplyr_0.8.1      tools_3.5.3      xfun_0.7        
#> [13] utf8_1.1.4       cli_1.1.0        htmltools_0.3.6  yaml_2.2.0      
#> [17] assertthat_0.2.1 digest_0.6.19    tibble_2.1.3     crayon_1.3.4    
#> [21] purrr_0.3.2      tidyr_0.8.3      vctrs_0.1.0      zeallot_0.1.0   
#> [25] curl_3.3         glue_1.3.1       evaluate_0.14    rmarkdown_1.13  
#> [29] stringi_1.4.3    compiler_3.5.3   pillar_1.4.1     backports_1.1.4 
#> [33] jsonlite_1.6     lubridate_1.7.4  pkgconfig_2.0.2
```

Data source license is below.

    “UBCI 인덱스”
    Copyright 2018 두나무(주) All rights reserved.
    Powered by 두나무/Upbit
