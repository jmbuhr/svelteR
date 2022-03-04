# svelteR

<!-- badges: start -->
<!-- badges: end -->

The goal of svelteR is to fluently embed svelte apps into Rmarkdown
documents producing html output.

## Installation

You can install svelteR from [GitHub](https://github.com/) with:

``` r
remotes::install_github("jmbuhr/svelteR")
```

Or when using the `renv` package for a local package library:

``` r
renv::install("jmbuhr/svelteR")
```

## Features

-   Embed the same app multiple times with different properties
-   Embed multiple different apps
-   Embed from a local folder or a public url (the second is work in
    process)
-   Works with most html output formats. i.e. not only `html_document`
    but also [Xaringan](https://github.com/yihui/xaringan)
    presentations!

See this
[example](https://jmbuhr.de/svelteR/articles/svelteR.html#demo-time-)

