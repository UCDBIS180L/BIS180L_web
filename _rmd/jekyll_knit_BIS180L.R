setwd("~/git/BIS180L_web/")
library(knitr)

jekyll.knit <- function(input) {
    rel.path = substr(input, 5, nchar(input) - 4)
    output = paste("_posts/", rel.path, ".md", sep = "")
    knit(input = input, output = output)
    system(paste("perl -pi -e 's|images/|{{ site.baseurl }}/images/|gi'", output, sep = " ")) # for non-R generated figures
    system(paste("perl -pi -e 's|figure/|{{ site.baseurl }}/figure/|gi'", output, sep = " ")) # for R figures generated during knitting
    
    
}
# .Rmd files in _rmd directory
# Usage example:
# jekyll.knit("_rmd/2013-XX-XX-post-name.Rmd")
 jekyll.knit("_rmd/2015-04-28-Shiny.Rmd")

