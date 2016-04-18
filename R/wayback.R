
wayback_base <- function() "http://archive.org/wayback/available"

#'@name wayback_GET
#'@example wayback_GET(wayback_base(), "example.com")
wayback_GET <- function(url, args, ...) {
	query <- setNames( list(args), c("url"))
	res <- httr::GET(url, query = query, ...)
	httr::stop_for_status(res)
	jsonlite::fromJSON(httr::content(res, "text"))
}

