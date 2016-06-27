# context("wayback")

test_that("wayback_url works", {

	skip_on_cran()
	skip_on_travis()
	skip_on_appveyor()
	
	expect_equal(length(wayback_url("https://www.python.org/psf/members/", "2014-09-01")), 2)
	
})

test_that("wayback_url fails well", {
	
	skip_on_cran()
	skip_on_travis()
	skip_on_appveyor()
	
	expect_null(wayback_url("http://floridasbestbagpipes.com")$url)
	
	expect_equal(wayback_url("https://www.python.org/psf/members/", "2014-09-01"), wayback_url("https://www.python.org/psf/members/", "20140901"))
	
})

test_that("wayback_scrape works", {

	skip_on_cran()
	skip_on_travis()
	skip_on_appveyor()
	
	expect_gte(length(wayback_scrape(wayback_url(url = "https://www.python.org/psf/members/", timestamp = "20140101")$url, "#board-of-directors li , #board-of-directors h1")), 1)

})

test_that("wayback_scrape fails well", {

	skip_on_cran()
	skip_on_travis()
	skip_on_appveyor()
	
	expect_error(wayback_scrape(wayback_url(url = "https://www.python.org/psf/members/", timestamp = "20140101")$url), "Please supply one of css or xpath")
	
	expect_error(wayback_scrape(wayback_url("http://floridasbestbagpipes.com")$url), "No page available to scrape")
	

})