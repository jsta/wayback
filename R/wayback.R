#' @name wayback
#' @title Query wayback machine API
#' @description Query wayback machine API
#' @export
#' @import httr
#' @import jsonlite
#' @param url character url
#' @param timestamp character date of 1-14 digits in YYYYMMDDhhmmss format
#' @examples 
#'wayback(url = "example.com", timestamp = "20060101")
#'wayback(url = "example.com")
wayback <- function(url, timestamp = NULL){
	args <- list(url = url, timestamp = timestamp)
	wayback_GET(wayback_base(), args)
}

wayback_GET <- function(base_url, args, ...) {
	res <- httr::GET(base_url, query = args, ...)
	httr::stop_for_status(res)
	jsonlite::fromJSON(httr::content(res, "text"))
}

wayback_base <- function() "http://archive.org/wayback/available"
