## Rotate axis tick labels 90 degrees

```r
+ theme(axis.text.x = element_text(angle = 90))
```

## Remove the legend

```r
+ theme(legend.position="none")
```

## Make COWPLOT fontsize a bit bigger

```r
mod_theme <- theme_cowplot(font_size = 16)
theme_set(mod_theme)
```

## Make PNG of high-density SVGs

SVG is great for posters, can resize at will. But if there are a lot of points, then we really want PNG. This workflow we export the point figure to SVG at the set size, and then convert to PNG using InkScape at the command line.

```r
ggsave("filename.svg", plot_to_save)
system("inkscape -z -d 300 -e outfile.png infile.svg")
```

## Include cowplot in package deps

If we want to use the cowplot theme, but keep from generating warnings, etc in R CMD check of when `loading` the package, then we should structure things like so:

```r
#' @import ggplot2

theme_set(cowplot::theme_cowplot())
```

And in DESCRIPTION:

```
imports: ggplot2, cowplot
```
