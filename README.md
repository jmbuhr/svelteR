
<!-- README.md is generated from README.Rmd. Please edit that file -->

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

Embed the same app multiple times with different properties:

``` r
svelteR::include_svelte(name = "svelte-app",
                        # path relative to your Rmd file
                        path = system.file("svelte-app", package = "svelteR"),
                        props = list(name = "First"))
```
