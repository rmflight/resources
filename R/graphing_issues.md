## Get an error about X11 Missing font

`X11 font -adobe-helvetica-%s-%s-*-*-%d-*-*-*-*-*-*-*, face 1 at size 12 could not be loaded`

The solution is:

`X11.options(type = "cairo")`

## Want to use a particular font in a graphic

For example, to add a Monospaced font to a graphic instead of a proportional font:

```
library(showtext)
font.add("FreeMono", "FreeMono.ttf")
showtext.auto()

Cairo("graphic.png", width = 2600, height = 3600, dpi = 300, bg = "#FFFFFF", fontfamily = "FreeMono")
plot(..., gpar(fontsize = 24, fontfamily = "FreeMono"))
dev.off()
```

## Want to graph a distribution

Need to graph a distribution? Use [this tip](https://twitter.com/TrevorABranch/status/1314630049094496256?s=20)

```
xvals = sort(rchisq(n = 1000, df = 30)
yvals = dchisq(x = xvals, df = 30)
plot(xvals, yvals, type = "l")
```
