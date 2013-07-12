\name{bushfire}
\alias{bushfire}
\alias{bushfirem}
\alias{bushfire.weights}
\docType{data}
\title{Bushfire scars}
\description{
The bushfire data set was used by Campbell (1984, 1989) to locate bushfire scars. 
The dataset contains satelite measurements on five frequency bands, corresponding to each of 38 pixels. 
}
\usage{data(bushfire)}
\format{
  A data frame with 38 observations on the 5 variables.
}
\details{
The data contains an outlying cluster of
observations 33 to 38 a second outlier cluster of observations
7 to 11 and a few more isolated outliers, namely
observations 12, 13, 31 and 32. bushfirem is created from bushfire by setting a proportion of 0.2 of the values to missing.}
\source{bushfirem:\code{
set.seed(234567891)
miss.rate <- 0.2
miss.ind<-rep(F,n*p)
miss.ind[sample(n*p,floor(miss.rate*n*p))]<-T
bushmiss<-matrix(miss.ind,ncol=5)
mean(bushmiss)
bushfirem<-bushfire
bushfirem[bushmiss]<-NA}

For testing purposes weights are provided: 
\code{bushfire.weights<-rep(c(1,2,5),length=nrow(bushfire))}

}
\references{
Campbell, N. (1989) Bushfire mapping using noaa avhrr data. Technical Report. Commonwealth Scientific and
Industrial Research Organisation, North Ryde.
}
\examples{
data(bushfire)
## maybe str(bushfire) ; plot(bushfire) ...
}
\keyword{datasets}
