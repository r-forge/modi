\name{weighted.var}
\alias{weighted.var}
\title{Weighted univariate variance coping with missing values}
\description{
This function is analogue to \code{weighted.mean}.  
}
\usage{
weighted.var(x, w, na.rm = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{a vector with data}
  \item{w}{positive weights (may not have missings where \code{x} is observed)}
  \item{na.rm}{if \code{TRUE} remove missing values}
}
\details{The weights \eqn{w} are standardised such that \eqn{\sum_{observed} w_i} equals the number of observed values in \eqn{x}. The function calculates \deqn{\sum_{observed} w_i (x_i-weighted.mean(x,w,na.rm=T))^2/((\sum_{observed} w_i)-1).}}
\value{
The weighted variance of \eqn{x} with weights \eqn{w} (with missing values removed when \code{na.rm=TRUE}).
}
%\references{}
\author{Beat Hulliger}
\seealso{See Also as \code{\link{weighted.mean}}}
\examples{
x<-rnorm(100)
x[sample(1:100,20)]<-NA
w<-rchisq(100,2)
weighted.var(x,w,na.rm=TRUE)
}
