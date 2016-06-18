#' @name wayback
#' @title Query wayback machine API
#' @description Query wayback machine API
#' @export
#' @import httr
#' @import jsonlite
#' @param url character url
#' @param timestamp character date of 1-14 digits in YYYYMMDDhhmmss format
#' @examples 
#'wayback(url = "example.com", timestamp = "20140101")
#'wayback(url = "example.com")
wayback_url <- function(url, timestamp = NULL){
	args <- list(url = url, timestamp = timestamp)
	res <- wayback_GET(wayback_base(), args)
	
	list(url = res$archived_snapshots$closest$url, timestamp = res$archived_snapshots$closest$timestamp)
}

wayback_GET <- function(base_url, args, ...) {
	res <- httr::GET(base_url, query = args, ...)
	httr::stop_for_status(res)
	jsonlite::fromJSON(httr::content(res, "text", encoding = "UTF-8"))
}

wayback_base <- function() "http://archive.org/wayback/available"
