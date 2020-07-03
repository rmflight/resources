```
---
title: "a good title"
author: "Robert M Flight"
date: "`r Sys.time()`"
output: 
  pdf_document: 
    toc: yes
urlcolor: blue
---
```

## Knitr chunk setup

```
{r setup, echo=FALSE}
knitr::opts_chunk$set(cache = TRUE, warning = FALSE, message = FALSE)
```

## Data Checking

```{r data_checking}
library(assertthat)
library(assertr)
```


## Packages Used

```{r packages_used, echo = FALSE}
pkg_info <- devtools::session_info()
pkg_info$platform
knitr::kable(pkg_info$packages)
```

## Wide Format PDF Tables in RMarkdown

```
---
header-includes:
  - \usepackage{longtable} # allows use of tables spanning pages
  - \usepackage{caption} # used if you need to define your own captions
  - \captionsetup{labelformat = empty} # for empty captions
output: pdf_document
classoption: landscape # turns output to landscape
---
```

```{r table_output}
out_table <- xtable::xtable(df, type = "latex")
xtable::caption(tmp_table) <- "caption text"
xtable::align(out_table) <- "llp{2in}ll" # assuming 4 column table, second column would only take up 2 inches of space
print(out_table, comment = FALSE, floating = FALSE, tabular.environment = "longtable") # important at end, to make sure that the environment is correct, because otherwise the tables won't display right, believe me

```

## Setting Parameters

```r
parameters = read_delim(

'Parameter     | Value | Units 
#--------------|-------|-------
 herd_size     | 20.00 | camels
 max_age       | 25.00 | years
 fertile_age   |  5.00 | years ',
 
 delim = '|', trim_ws = TRUE, comment = "#')
 
input = structure(as.list(parameters$Value),
                  names = parameters$Parameter)
kable(parameters, align = c('l', 'r', 'l'), caption = 'Model Parameters')
```