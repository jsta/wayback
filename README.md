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

pyfound_2014 <- html_text(html_nodes(read_html(python_foundation2014$url), "#board-of-directors li , #board-of-directors h1"))

pyfound_gender <- gender::gender(do.call("c", lapply(python_foundation2014, function(x) strsplit(x, " ")[[1]][1])))

table(pyfound_gender$gender)[2] / sum(table(pyfound_gender$gender)) * 100

```