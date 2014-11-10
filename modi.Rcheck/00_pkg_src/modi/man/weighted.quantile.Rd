\name{weighted.quantile}
\alias{weighted.quantile}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Quantiles of a weighted cdf}
\description{
A weighted cdf is calculated and quantiles are evaluated. Missing values are discarded.
}
\usage{
weighted.quantile(x, w, prob = 0.5, plot = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{vector of data}
  \item{w}{vector of (sampling) weights}
  \item{prob}{The probability for the quantile }
  \item{plot}{if \code{TRUE} the weighted cdf is plotted}
}
\details{
Weighted linear interpolation in case of non-unique inverse. Gives a warning when the contribution of the weight of the smallest observation to the total weight is larger than \code{prob}.
}
\value{The quantile for proporiont \code{prob}.
}
\author{Beat Hulliger}
\note{No variance calculation. 
}
\seealso{\code{\link[survey]{svyquantile}} }
\examples{
x<-rnorm(100)
x[sample(1:100,20)]<-NA
w<-rchisq(100,2)
weighted.quantile(x,w,0.2,TRUE)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
