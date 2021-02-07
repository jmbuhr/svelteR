#' Embed a Svelte App
#'
#' Use this function to embed a svelte app from a directory / file-path into your
#' output document (needs to be html).
#'
#' @param path :: String, path to the svelte app main directory
#'
#' @return Code that is inserted into the output document
#' @export
include_svelte <- function(name, path, props) {
  label <- knitr::opts_current$get("label")
  label <- stringr::str_remove_all(label, "\\W")
  knitr::asis_output(
    glue::glue(
"
<div id='{label}'></div>
<link rel='stylesheet' href='{path}/public/global.css'>
<link rel='stylesheet' href='{path}/public/build/bundle.css'>
<script>
function load{label}() {{
  window['{name}']('{label}', {as.character(jsonlite::toJSON(props))})
}}
</script>
<script async onload='load{label}()' src='{path}/public/build/bundle.js'></script>
"))
}
