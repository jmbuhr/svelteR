#' Embed a Svelte App
#'
#' Use this function to embed a svelte app from a directory / file-path into your
#' output document (needs to be html).
#' Check out this article for the svelte-app setup:
#' <https://jmbuhr.de/svelteR/articles/svelteR.html>
#'
#' @param name :: String, name of the svelte app, usually the same as
#' the name of the directory
#'
#' @param path :: String, File path to the svelte-app publish directory. e.g. "svelte-app/docs"
#' or "svelte-app/public"
#'
#' @param props :: List, An R list of properties passed to the svelte-app.
#' Will be automatically converted to JSON.
#'
#' @param self_contained :: Boolean. By default, Rmarkdown's html_document is
#' self contained, meaning it includes all images and external code automatically
#' into one html file. Setting `self_contained = FALSE` will set the pandoc option
#' `"data-external='1'"` on the source attributes of the svelte code,
#' allowing the scripts and css to be linked-in externally instead of included
#' in the one-file document.
#'
#' @return Code that is inserted into the output document
#' @export
include_svelte <- function(name, path, props, self_contained = TRUE) {
  label <- knitr::opts_current$get("label")
  label <- stringr::str_remove_all(label, "\\W")
  external <- ifelse(self_contained, "", "data-external='1'")

  # check if an app with the same name is already included:
  is_new_app <- add_app(name)

  # add a div for the app
  div <- "<div id='{label}'></div>"

  # include code of new app
  app_code <- ifelse(is_new_app,
                     "<link rel='stylesheet' href='{path}/global.css' {external}>
                      <link rel='stylesheet' href='{path}/build/bundle.css' {external}>
                      <script async id='{name}' src='{path}/build/bundle.js' {external}></script>",
                     "")

  # register onload with the id of the script tag for the app
  onload_code <- "
  <script>
  function load{label}() {{
    window['{name}']('{label}', {as.character(jsonlite::toJSON(props))})
  }}
  document.getElementById('{name}').addEventListener('load', load{label})
  </script>
  "

  knitr::asis_output(
    glue::glue(div,
               app_code,
               onload_code))
}

# Environment for the unique apps vector:
.onLoad <- function(libname, pkgname) {
  svelte_apps <<- new.env()
}

#' Add app to list of unique apps
#'
#' @param name :: String, name of the app to check for uniqueness in the
#' current session. New names will be added to a vector in an
#' environemt called `svelte_apps`.
#'
#' @return Boolean value for if the app is a new app.
add_app <- function(name) {
  if (exists("apps", where = svelte_apps)) {
    if (name %in% svelte_apps$apps) {
      new_app <- FALSE
    } else {
      svelte_apps$apps <- c(svelte_apps$apps, name)
      new_app <- TRUE
    }
  } else {
    svelte_apps$apps <- name
    new_app <- TRUE
  }
  return(new_app)
}
