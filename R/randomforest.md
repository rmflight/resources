## Separability plot

Use `cmdscale` on the proximities to look at how the samples behave in `RF`.

```r
# generate model
rf_model <- randomForest(x ...., proximity = TRUE)
# generate MDS scaling of proximities
rf_sep <- stats::cmdscale(1 - rf_model$proximity, k = 2, eig = TRUE) # two components, using eigenvalue based 
# data.frames are nicer to work with, but just need the points from cmdscale
rf_sep <- as.data.frame(rf_sep$points)
names(rf_sep) <- c("dim1", "dim2")

# add your class information so can see how classes behave relative to one another using coloring (or shape, etc)
rf_sep$class <- factor_of_classes

ggplot(rf_sep, aes(x = dim1, y = dim2, color = class)) + geom_point()
```