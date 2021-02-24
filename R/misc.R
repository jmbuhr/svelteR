#' Write Props for Development
#'
#' Write a .js file to be read in by index.html.
#' It defines a JS object called props that can be filled
#' with any R object convertible into JSON.
#'
#' @param path :: String, File path to the svelte-app publish directory. e.g. "svelte-app/docs"
#' or "svelte-app/public"
#' @param props :: Any, Any R object convertible into JSON to pass to the app
#'
#' @return
#' @export
write_dev_props <- function(path, props) {
  path <- glue::glue("{path}/dev_props.js")
  content <- glue::glue("props = {as.character(jsonlite::toJSON(props))};")
  writeLines(content, path)
}
