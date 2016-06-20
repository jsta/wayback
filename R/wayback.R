#' @name wayback_scrape
#' @title Scrape wayback url's using the rvest package
#' @description Scrape wayback url's using the rvest package
#' @export
#' @import rvest
#' @import xml2
#' @param url Wayback Machine url
#' @param css Nodes to select.
#' @param xpath Nodes to select.
#' @examples
#' wayback_scrape(wayback_url(url =
#'  "https://www.python.org/psf/members/",
#'  timestamp = "20140101")$url,
#'  "#board-of-directors li , #board-of-directors h1")
wayback_scrape <- function(url, css, xpath){
	if(is.null(url)){
		stop("No page available to scrape")
	}
	res <- xml2::read_html(url)
	rvest::html_text(rvest::html_nodes(res, css, xpath))
}

#' @name wayback_url
#' @title Query wayback machine API
#' @description Query wayback machine API
#' @export
#' @import httr
#' @import jsonlite
#' @param url character url
#' @param timestamp character date of 1-14 digits in YYYYMMDDhhmmss format
#' @examples 
#'wayback_url(url = "example.com", timestamp = "20140101")
wayback_url <- function(url, timestamp = NULL){
	
	if(length(grep("-", timestamp)) > 0 & !is.null(timestamp)){
		timestamp <- gsub("-", "", timestamp)
	}
	
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
