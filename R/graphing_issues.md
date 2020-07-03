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