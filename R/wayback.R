

wayback_base <- function() "http://archive.org/wayback/available"

wayback_GET <- function(url, args, ...) {
	res <- httr::GET(url, query = args, ...)
	httr::stop_for_status(res)
	browser()
	
	httr::content(res, "text")
	url <- httr::modify_url(url, query = args)
	jsonlite::fromJSON(url)
	
	
	httr::headers(res)
	#jsonlite::fromJSON(res)
	#httr::accept_json(res)
	jsonlite::fromJSON(httr::content(res, "text"))
}

test <- wayback_GET(wayback_base(), "example.com", httr::accept_json())