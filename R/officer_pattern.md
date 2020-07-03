```r
library(officer)
doc <- read_pptx()

p <- ggplot() ....

doc <- addSlide(doc, x, layout = "Title and Content", master = "Office Theme")

doc <- addPlot(doc = doc, fun = print, x = p, vector.graphic = TRUE)

writeDoc(doc = doc, file = "file.pptx")
```