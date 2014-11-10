pkgname <- "modi"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
options(pager = "console")
library('modi')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
cleanEx()
nameEx("BEM")
### * BEM

flush(stderr()); flush(stdout())

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



cleanEx()
nameEx("EAdet")
### * EAdet

flush(stderr()); flush(stdout())

### Name: EAdet
### Title: Epidemic Algorithm for detection of multivariate outliers in
###   incomplete survey data.
### Aliases: EAdet
### Keywords: survey robust multivariate

### ** Examples

data(bushfirem,bushfire.weights)
det.res<-EAdet(bushfirem,bushfire.weights)
print(det.res$output)



cleanEx()
nameEx("EAimp")
### * EAimp

flush(stderr()); flush(stdout())

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



cleanEx()
nameEx("ER")
### * ER

flush(stderr()); flush(stdout())

### Name: ER
### Title: Robust EM-algorithm ER
### Aliases: ER
### Keywords: robust survey multivariate

### ** Examples

data(bushfirem)
data(bushfire.weights)
det.res<-ER(bushfirem, weights=bushfire.weights,alpha=0.05,steps.output=TRUE,em.steps=100,tol=2e-6)
plotMD(det.res$dist,ncol(bushfirem))



cleanEx()
nameEx("GIMCD")
### * GIMCD

flush(stderr()); flush(stdout())

### Name: GIMCD
### Title: Gaussian imputation followed by MCD
### Aliases: GIMCD
### Keywords: robust multivariate survey

### ** Examples

data(bushfirem)
det.res<-GIMCD(bushfirem,alpha=0.1)
print(det.res$center)
plotMD(det.res$dist,ncol(bushfirem))



cleanEx()
nameEx("MDmiss")
### * MDmiss

flush(stderr()); flush(stdout())

### Name: MDmiss
### Title: Mahalanobis distance (MD) for data with missing values.
### Aliases: MDmiss
### Keywords: ~kwd1 ~kwd2

### ** Examples

data(bushfirem,bushfire)
MDmiss(bushfirem,apply(bushfire,2,mean),var(bushfire))



cleanEx()
nameEx("POEM")
### * POEM

flush(stderr()); flush(stdout())

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



cleanEx()
nameEx("TRC")
### * TRC

flush(stderr()); flush(stdout())

### Name: TRC
### Title: Transformed rank correlations for multivariate outlier detection
### Aliases: TRC
### Keywords: robust multivariate survey

### ** Examples

data(bushfirem,bushfire.weights)
det.res<-TRC(bushfirem,weights=bushfire.weights)
plotMD(det.res$dist,ncol(bushfirem))
print(det.res)



cleanEx()
nameEx("bushfire")
### * bushfire

flush(stderr()); flush(stdout())

### Name: bushfire
### Title: Bushfire scars
### Aliases: bushfire bushfirem bushfire.weights
### Keywords: datasets

### ** Examples

data(bushfire)
## maybe str(bushfire) ; plot(bushfire) ...



cleanEx()
nameEx("plotMD")
### * plotMD

flush(stderr()); flush(stdout())

### Name: plotMD
### Title: QQ-Plot of Mahalanobis distances
### Aliases: plotMD
### Keywords: Mahalanobis distance QQ-plot

### ** Examples

data(bushfirem,bushfire.weights)
det.res<-TRC(bushfirem,weights=bushfire.weights)
plotMD(det.res$dist,ncol(bushfirem))



cleanEx()
nameEx("sepe")
### * sepe

flush(stderr()); flush(stdout())

### Name: sepe
### Title: Sample Environment Protection Expenditure Survey
### Aliases: sepe
### Keywords: datasets, multivariate, outliers, enterprise, missing values

### ** Examples

data(sepe)
## maybe str(sepe) ; plot(sepe) ...



cleanEx()
nameEx("weighted.quantile")
### * weighted.quantile

flush(stderr()); flush(stdout())

### Name: weighted.quantile
### Title: Quantiles of a weighted cdf
### Aliases: weighted.quantile

### ** Examples

x<-rnorm(100)
x[sample(1:100,20)]<-NA
w<-rchisq(100,2)
weighted.quantile(x,w,0.2,TRUE)



cleanEx()
nameEx("weighted.var")
### * weighted.var

flush(stderr()); flush(stdout())

### Name: weighted.var
### Title: Weighted univariate variance coping with missing values
### Aliases: weighted.var

### ** Examples

x<-rnorm(100)
x[sample(1:100,20)]<-NA
w<-rchisq(100,2)
weighted.var(x,w,na.rm=TRUE)



cleanEx()
nameEx("winsimp")
### * winsimp

flush(stderr()); flush(stdout())

### Name: winsimp
### Title: Winsorization followed by imputation
### Aliases: winsimp
### Keywords: robust multivariate survey

### ** Examples

data(bushfirem,bushfire.weights)
det.res<-TRC(bushfirem,weight=bushfire.weights)
imp.res<-winsimp(bushfirem,det.res$output$center,det.res$output$scatter,det.res$outind)
print(imp.res$output)



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
