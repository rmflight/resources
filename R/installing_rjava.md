
# rJava: can't load .so object

```
R CMD javareconf -e
```

Restart R / RStudio (i.e. complete shutdown and restart)

# rJava, no jni.h

If you've confirmed that jni.h can be found, and that

`R CMD javareconf -n`

still shows an error, and it seems to be mainly due to using the incorrect directory for JAVA, one solution may be to make a link from the directory `R` wants to use, to the actual one.

`sudo ln /usr/lib/jvm/right_java_dir /usr/lib/jvm/wrong_java_dir`