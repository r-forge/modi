\name{weighted.var}
\alias{weighted.var}
\title{Weighted univariate variance coping with missing values}
\description{
This function is as weighted.mean. The squares are weighted with w and the divisor is sum(w)-1. 
}
\usage{
weighted.var(x, w, na.rm = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{a vector with data}
  \item{w}{positive weights}
  \item{na.rm}{if \code{TRUE} remove missing values}
}
\value{
  \item{comp1 }{Description of 'comp1'}
  \item{comp2 }{Description of 'comp2'}
}
\references{ ~put references to the literature/web site here ~ }
\author{Beat Hulliger}
\seealso{See Also as \code{\link{weighted.mean}}}
\examples{
x<-rnorm(100)
x[sample(1:100,20)]<-NA
w<-rchisq(100,2)
weighted.var(x,w,na.rm=TRUE)
}
