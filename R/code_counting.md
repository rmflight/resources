If you want to know how many lines of code are in an Rmd file:

```
rmarkdown::render("file.Rmd", output_format = "md_document")

cat file.md | grep -c '^ \{4\}'
```

And then how many lines of code in .R files:

```
wc --lines file.R
```