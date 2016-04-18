#'@name wayback
#'@param url character url
#'@examples wayback("example.com")
wayback <- function(url){
	wayback_GET(wayback_base(), url)
}

wayback_GET <- function(base_url, args, ...) {
	query <- setNames(list(args), c("url"))
	res <- httr::GET(base_url, query = query, ...)
	httr::stop_for_status(res)
	jsonlite::fromJSON(httr::content(res, "text"))
}

wayback_base <- function() "http://archive.org/wayback/available"
