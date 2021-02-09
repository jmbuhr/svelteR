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
  knitr::asis_output(
    glue::glue(
"
<div id='{label}'></div>
<link rel='stylesheet' href='{path}/public/global.css' {external}>
<link rel='stylesheet' href='{path}/public/build/bundle.css' {external}>
<script>
function load{label}() {{
  window['{name}']('{label}', {as.character(jsonlite::toJSON(props))})
}}
</script>
<script async onload='load{label}()' src='{path}/public/build/bundle.js' {external}></script>
"))
}
