\name{winsimp}
\alias{winsimp}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Winsorization followed by imputation
}
\description{
Winsorisation of outliers according to the Mahalanobis distance followed by an imputation under the multivariate normal model. Only the outliers are winsorized. The Mahalanobis distance \code{MDmiss} allows for missing values. 
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
It is assumed that \code{center}, \code{scatter} and \code{outind} stem from a multivariate outlier detection algorithm which produces robust estimates and which declares outliers observations with a large Mahalanobis distance.  The cutpoint is calculated as the least (unsquared) Mahalanobis distance among the outliers. The winsorization reduces the weight of the outliers: \deqn{\hat y_i=\mu_R+(y_i-\mu_R)\cdot c/d_i}{y_i=\mu_R +(y_i-\mu_R)*c/d_i}, where \eqn{\mu_R} is the robust center and \eqn{d_i} is the (unsquared) Mahalanobis distance of observation i. 
}
\value{Function \code{winsimp} returns a list whose first component \code{output} is a sub-list with the follwing components:
\item{cutpoint}{Cutpoint for outliers}
\item{proc.time}{Processing time}
\item{n.missing.before}{Number of missing values before}
\item{n.missing.after}{Number of missing values after imputation}

The further component returned by \code{winsimp} is 

\item{imputed.data}{Imputed data set.}
}
\references{
Hulliger, B. (2007) Multivariate Outlier Detection and Treatment in Business Surveys, Proceedings of the III International Conference on Establishment Surveys, Montr\'{e}al.
}
\author{
Beat Hulliger
}
\seealso{\code{MDmiss}. 
Uses \code{\link{imp.norm}} from the \code{\link{norm}} package.
}
\examples{
data(bushfirem,bushfire.weights)
det.res<-TRC(bushfirem,weight=bushfire.weights)
imp.res<-winsimp(bushfirem,det.res$output$center,det.res$output$scatter,det.res$outind)
print(imp.res$output)
}
\keyword{robust}
\keyword{multivariate}
\keyword{survey}% __ONLY ONE__ keyword per line
