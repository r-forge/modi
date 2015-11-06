pkgname <- "modi"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
options(pager = "console")
base::assign(".ExTimings", "modi-Ex.timings", pos = 'CheckExEnv')
base::cat("name\tuser\tsystem\telapsed\n", file=base::get(".ExTimings", pos = 'CheckExEnv'))
base::assign(".format_ptime",
function(x) {
  if(!is.na(x[4L])) x[1L] <- x[1L] + x[4L]
  if(!is.na(x[5L])) x[2L] <- x[2L] + x[5L]
  options(OutDec = '.')
  format(x[1L:3L], digits = 7L)
},
pos = 'CheckExEnv')

### * </HEADER>
library('modi')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
cleanEx()
nameEx("BEM")
### * BEM

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: BEM
### Title: BACON-EEM Algorithm for multivariate outlier detection in
###   incomplete multivariate survey data
### Aliases: BEM
### Keywords: robust survey multivariate

### ** Examples

# Bushfire data set with 20% MCAR
data(bushfirem,bushfire.weights)
bem.res<-BEM(bushfirem,bushfire.weights,alpha=(1-0.01/nrow(bushfirem))) 
print(bem.res$output)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("BEM", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("EAdet")
### * EAdet

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: EAdet
### Title: Epidemic Algorithm for detection of multivariate outliers in
###   incomplete survey data.
### Aliases: EAdet
### Keywords: survey robust multivariate

### ** Examples

data(bushfirem,bushfire.weights)
det.res<-EAdet(bushfirem,bushfire.weights)
print(det.res$output)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("EAdet", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("EAimp")
### * EAimp

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: EAimp
### Title: Epidemic Algorithm for imputation of multivariate outliers in
###   incomplete survey data.
### Aliases: EAimp
### Keywords: survey robust multivariate

### ** Examples

data(bushfirem,bushfire.weights)
det.res<-EAdet(bushfirem,bushfire.weights)
imp.res<-EAimp(bushfirem,bushfire.weights,outind=det.res$outind,
reach=det.res$output$max.min.di,kdon=3)
print(imp.res$output)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("EAimp", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("ER")
### * ER

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: ER
### Title: Robust EM-algorithm ER
### Aliases: ER
### Keywords: robust survey multivariate

### ** Examples

data(bushfirem)
data(bushfire.weights)
det.res<-ER(bushfirem, weights=bushfire.weights,alpha=0.05,steps.output=TRUE,em.steps=100,tol=2e-6)
PlotMD(det.res$dist,ncol(bushfirem))



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("ER", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("GIMCD")
### * GIMCD

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: GIMCD
### Title: Gaussian imputation followed by MCD
### Aliases: GIMCD
### Keywords: robust multivariate survey

### ** Examples

data(bushfirem)
det.res<-GIMCD(bushfirem,alpha=0.1)
print(det.res$center)
PlotMD(det.res$dist,ncol(bushfirem))



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("GIMCD", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("MDmiss")
### * MDmiss

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: MDmiss
### Title: Mahalanobis distance (MD) for data with missing values.
### Aliases: MDmiss
### Keywords: ~kwd1 ~kwd2

### ** Examples

data(bushfirem,bushfire)
MDmiss(bushfirem,apply(bushfire,2,mean),var(bushfire))



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("MDmiss", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("POEM")
### * POEM

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: POEM
### Title: Nearest Neighbour Imputation with Mahalanobis distance
### Aliases: POEM
### Keywords: robust multivariate survey

### ** Examples

data(bushfirem)
data(bushfire.weights)
outliers<-rep(0,nrow(bushfirem))
outliers[31:38]<-1
imp.res<-POEM(bushfirem,bushfire.weights,outliers,prel=TRUE)
print(imp.res$output)
var(imp.res$imputed.data)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("POEM", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("TRC")
### * TRC

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: TRC
### Title: Transformed rank correlations for multivariate outlier detection
### Aliases: TRC
### Keywords: robust multivariate survey

### ** Examples

data(bushfirem, bushfire.weights)
det.res <- TRC(bushfirem, weights=bushfire.weights)
PlotMD(det.res$dist, ncol(bushfirem))
print(det.res)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("TRC", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("bushfire")
### * bushfire

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: bushfire
### Title: Bushfire scars
### Aliases: bushfire bushfirem bushfire.weights
### Keywords: datasets

### ** Examples

data(bushfire)
## maybe str(bushfire) ; plot(bushfire) ...



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("bushfire", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("plotMD")
### * plotMD

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: PlotMD
### Title: QQ-Plot of Mahalanobis distances
### Aliases: PlotMD
### Keywords: Mahalanobis distance QQ-plot

### ** Examples

data(bushfirem,bushfire.weights)
det.res<-TRC(bushfirem,weights=bushfire.weights)
PlotMD(det.res$dist,ncol(bushfirem))



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("plotMD", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("sepe")
### * sepe

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: sepe
### Title: Sample Environment Protection Expenditure Survey
### Aliases: sepe
### Keywords: datasets, multivariate, outliers, enterprise, missing values

### ** Examples

data(sepe)
## maybe str(sepe) ; plot(sepe) ...



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("sepe", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("weighted.quantile")
### * weighted.quantile

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: weighted.quantile
### Title: Quantiles of a weighted cdf
### Aliases: weighted.quantile

### ** Examples

x<-rnorm(100)
x[sample(1:100,20)]<-NA
w<-rchisq(100,2)
weighted.quantile(x,w,0.2,TRUE)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("weighted.quantile", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("weighted.var")
### * weighted.var

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: weighted.var
### Title: Weighted univariate variance coping with missing values
### Aliases: weighted.var

### ** Examples

x<-rnorm(100)
x[sample(1:100,20)]<-NA
w<-rchisq(100,2)
weighted.var(x,w,na.rm=TRUE)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("weighted.var", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("winsimp")
### * winsimp

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: Winsimp
### Title: Winsorization followed by imputation
### Aliases: Winsimp
### Keywords: robust multivariate survey

### ** Examples

data(bushfirem,bushfire.weights)
det.res<-TRC(bushfirem,weight=bushfire.weights)
imp.res<-Winsimp(bushfirem,det.res$output$center,det.res$output$scatter,det.res$outind)
print(imp.res$output)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("winsimp", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
### * <FOOTER>
###
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
