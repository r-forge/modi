\name{winsimp}
\Rdversion{1.1}
\alias{winsimp}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Winsorization followed by imputation
}
\description{
Winsorisation of outliers according to the Mahalanobis distance followed by an imputation under the multivariate normal model.
}
\usage{
winsimp(data, center, scatter, outind, seed = 1000003)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{data}{Data frame with the data}
  \item{center}{(Robust) estimate of the center (location) of the observations}
  \item{scatter}{(Robust) estimate of the scatter (covariance-matrix) of the observations}
  \item{outind}{Logical vector indicating outliers with 1 or TRUE for outliers}
  \item{seed}{Seed for random number generator}
}
\details{
It is assumed that \code{center}, \code{scatter} and \code{outind} stem from a multivariate outlier detection algorithm which produces robust estimates and which declares outliers observations with a large Mahalanobis distance. The winsorization reduces the weight of the outliers. The cutpoint is calculated as the least Mahalanobis distance among the outliers. 
}
\value{
The result are saved in winsimp.r and the imputed data is in winsimp.i.
}
\references{
Hulliger, B. (2007) Multivariate Outlier Detection and Treatment in Business Surveys, Proceedings of the III International Conference on Establishment Surveys, Montr\'{e}al.
}
\author{
Beat Hulliger
}
\seealso{
Uses \code{\link{imp.norm}} from the \code{\link{norm}} package.
}
\examples{
data(bushfirem,bushfire.weights)
TRC(bushfirem,weight=bushfire.weights)
bushfire.imp<-winsimp(bushfirem,TRC.r$center,TRC.r$scatter,TRC.i$outind)
}
\keyword{robust}
\keyword{multivariate}
\keyword{survey}% __ONLY ONE__ keyword per line
