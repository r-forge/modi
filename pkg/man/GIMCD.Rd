\name{GIMCD}
\alias{GIMCD}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Gaussian imputation followed by MCD}
\description{
Gaussian imputation uses the classical non-robust mean and covariance estimator and then imputes predictions under the multivariate normal model. Outliers may be created by this procedure. Then a high-breakdown robust estimate of the location and scatter with the Minimum Covariance Determinant algorithm is obtained and finally outliers are determined based on Mahalanobis distances based on the robust location and scatter.
}
\usage{
GIMCD(data, alpha = 0.05,  seed = 234567819)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{data}{ a data frame or matrix with the data }
  \item{alpha}{ a threshold value for the cut-off for the outlier Mahalanobis distances }
  \item{seed}{random number generator seed}
}
\details{
Normal imputation from package \code{norm} and MCD from package \code{MASS}. Note that currently MCD does not accept weights.
}
\value{
Result is stored in a global list GIMCD.r:
  \item{center}{robust center}
  \item{scatter}{robust covariance}
  \item{alpha}{Quantile for cut-off value}
  \item{computation.time}{Elapsed computation time}
  \item{outind}{logical vector of outlier indicators}
  \item{dist}{Mahalanobis distances}
}
\references{B\'{e}guin, C. and Hulliger, B. (2008) The BACON-EEM Algorithm for Multivariate Outlier Detection 
in Incomplete Survey Data, \emph{Survey Methodology}, Vol. 34, No. 1, pp. 91-103.}
\author{Beat Hulliger }
\seealso{  \code{\link{cov.mcd}}, \code{\link{norm}} }
\examples{
data(bushfirem)
det.res<-GIMCD(bushfirem,alpha=0.1)
print(det.res$center)
plotMD(det.res$dist,ncol(bushfirem))
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{robust}
\keyword{multivariate}
\keyword{survey}
% __ONLY ONE__ keyword per line
