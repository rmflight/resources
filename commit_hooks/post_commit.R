#!/path/2/Rscript

# License: CC0 (just be nice and point others to where you got this)
# Author: Robert M Flight <rflight79@gmail.com>, github.com/rmflight
#
# This is a post-commit hook that after a successful commit subsequently increments the package version in DESCRIPTION
# and commits that. Analogous to the pre-commit at https://gist.github.com/rmflight/8863882, but useful if you only have
# good reasons for not doing it on the pre-commit.
#
# To install it, simply copy this into the ".git/hooks/post-commit" file of your git repo, change /path/2/Rscript, and make
# it executable. Note that /path/2/Rscript is the same as your /path/2/R/bin/R, or may be in /usr/bin/Rscript depending on
# your installation. This has been tested on both Linux and Windows installations.
#
# In instances where you do NOT want the version incremented, add the environment variable doIncrement=FALSE to your git
# call. eg "doIncrement=FALSE git commit -m "commit message"".
# This is useful when you change the major version number for example.

doIncrement <- TRUE # default

# get the environment variable and modify if necessary
tmpEnv <- as.logical(Sys.getenv("doIncrement"))
if (!is.na(tmpEnv)){
  doIncrement <- tmpEnv
}

if (doIncrement){

  currDir <- getwd() # this should be the top level directory of the git repo
  currDCF <- read.dcf("DESCRIPTION")
  currVersion <- currDCF[1,"Version"]
  splitVersion <- strsplit(currVersion, ".", fixed=TRUE)[[1]]
  nVer <- length(splitVersion)
  currEndVersion <- as.integer(splitVersion[nVer])
  newEndVersion <- as.character(currEndVersion + 1)
  splitVersion[nVer] <- newEndVersion
  newVersion <- paste(splitVersion, collapse=".")
  currDCF[1,"Version"] <- newVersion
  currDCF[1, "Date"] <- strftime(as.POSIXlt(Sys.Date()), "%Y-%m-%d")
  write.dcf(currDCF, "DESCRIPTION")
  system("git add DESCRIPTION")
  system('doIncrement=FALSE git commit -m "increment package version"') # doIncrement=FALSE is required, otherwise we end up in an infinite loop
  cat("Incremented package version and committed!\n")
}