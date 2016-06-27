# wayback

R interface to the WayBack Machine API
[https://archive.org/help/wayback_api.php](https://archive.org/help/wayback_api.php)

## Installation

```r
install.packages(c("httr", "jsonlite", "rvest"))
devtools::install_github("jsta/wayback")
```

## Example Usage

```r
pyfound_2014 <- wayback_url(url = "https://www.python.org/psf/members/", timestamp = "20140101")

pyfound_2014 <- wayback_scrape(pyfound_2014$url, "#board-of-directors li , #board-of-directors h1")
```