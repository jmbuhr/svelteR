% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/include_svelte.R
\name{include_svelte}
\alias{include_svelte}
\title{Embed a Svelte App}
\usage{
include_svelte(name, path, props, self_contained = TRUE)
}
\arguments{
\item{name}{:: String, name of the svelte app, usually the same as
the name of the directory}

\item{path}{:: String, File path to the svelte-app publish directory. e.g. "svelte-app/docs"
or "svelte-app/public"}

\item{props}{:: List, An R list of properties passed to the svelte-app.
Will be automatically converted to JSON.}

\item{self_contained}{:: Boolean. By default, Rmarkdown's html_document is
self contained, meaning it includes all images and external code automatically
into one html file. Setting \code{self_contained = FALSE} will set the pandoc option
\code{"data-external='1'"} on the source attributes of the svelte code,
allowing the scripts and css to be linked-in externally instead of included
in the one-file document.}
}
\value{
Code that is inserted into the output document
}
\description{
Use this function to embed a svelte app from a directory / file-path into your
output document (needs to be html).
Check out this article for the svelte-app setup:
\url{https://jmbuhr.de/svelteR/articles/svelteR.html}
}
