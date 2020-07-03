## Advanced R

In the shell:

```
git clone https://github.com/hadley/adv-r.git
gem install jekyll mime-types
```

In R:

```r
install.packages(c("rcpp", "rjsonio", "knitr", "ggplot2", "png", "lubridate", "yaml", "microbenchmark", "dplyr", "plyr", "stringr", "memoise", "inline", "fastmatch"))
devtools::install_github(c("hadley/pryr", "hadley/lineprof", "yihui/knitr", "rstudio/rmarkdown", "hadley/bookdown"))
```

Now back in the shell:

```
cd adv-r
jekyll build
```

This should have created a directory `_site`. You can now create an ebook using Calibre by adding the `_site/index.html` file (calibre should automatically follow all the links to the other pages in the directory) and converting it to Epub.

## R-Packages
 
In the shell:

```
git clone https://github.com/hadley/r-pkgs.git
gem install jekyll mime-types
```

In R:

```r
devtools::install_github(c("hadley/bookdown", "rstudio/rmarkdown", "hadley/bookdown", "ropensci/testdat"))
install.packages(c("rjsonio", "knitr", "png", "testthat", "nycflights13", "stringi", "lubridate", "pryr", "microbenchmark", "roxygen2"))
```

Now back in the shell:

```
cd r-pkgs
jekyll build
```

This should have created a directory `_site`. You can now create an ebook using Calibre by adding the `_site/index.html` file (calibre should automatically follow all the links to the other pages in the directory) and converting it to Epub.