pkgname <- "shoppingwords"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
library('shoppingwords')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
base::assign(".old_wd", base::getwd(), pos = 'CheckExEnv')
cleanEx()
nameEx("normalize_text")
### * normalize_text

flush(stderr()); flush(stdout())

### Name: normalize_text
### Title: Normalize stopwords This function loads stopwords from a CSV
###   file within the package.
### Aliases: normalize_text

### ** Examples

user_input <- "Göre"
match <- amatch("göre", stopwords_all, method = "lv", maxDist = 1)
normalized_input <- normalize_text(user_input)



### * <FOOTER>
###
cleanEx()
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
