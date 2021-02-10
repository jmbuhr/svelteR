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
#' @param path :: String, path to the svelte app main directory
#'
#' @param props :: List, An R list of properties passed to the svelte-app.
#' Will be automatically converted to JSON.
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
                     "<link rel='stylesheet' href='{path}/public/global.css' {external}>
                      <link rel='stylesheet' href='{path}/public/build/bundle.css' {external}>
                      <script async id='{name}' src='{path}/public/build/bundle.js' {external}></script>",
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

# check if an app with the same name is already included:
# Global unique app counter
.onLoad <- function(libname, pkgname) {
  svelte_apps <<- new.env()
}

# add unique apps and return whether the app is new
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
