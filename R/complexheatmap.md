## Modify the font sizes in the heatmap

If you want to get the font sizes right for a plot, you will need to play with these font sizes

```r
# add the following, add col* if you want to modify both
row_names_gp = gpar(fontsize = 24, fontfamily = "FreeMono")
```

## Saving a PNG

```r
Cairo("filename", width = 2600, height = 6210, dpi = 300, bg = "#FFFFFF", fontfamily = "FreeMono")
Heatmap(heatmap, colormap, "Expression", cluster_rows = FALSE, cluster_columns = FALSE, row_names_gp = gpar(fontsize = 24, fontfamily = "FreeMono"), column_names_gp = gpar(fontsize = 30))
dev.off()
```