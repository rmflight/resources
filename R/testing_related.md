
## working with temp temp directories

I think this is now handled by `withr::local_tempfile`, but it is good to know about this approach as well.

```r
create_in_temp <- function(dir_loc, create_it = TRUE) {
  temp_path <- tempfile(pattern = paste0("copyfiles-test-", dir_loc))
  if (create_it) {
    dir.create(temp_path)
  }
  temp_path
}
erase <- function(path) unlink(path, recursive = TRUE)
```

## skipping tests conditionally

- in ci have `export skip_variable=TRUE`

```r
skip_variable <- as.logical(Sys.getenv("skip_variable"))
if (is.na(skip_variable)) {
  skip_variable <- FALSE
}

test_that("test we want to skip conditionally", {
  skip_if_not(skip_variable)
  expect_true(test condition)
})

test_that("other tests", {

})
```