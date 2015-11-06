\name{ER}
\alias{ER}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Robust EM-algorithm ER}
\description{
The \code{ER} function is an implementation of the ER-algorithm of Little and Smith (1987). 
}
\usage{
ER(data, weights, alpha = 0.01, psi.par = c(2, 1.25), 
em.steps = 100, steps.output = FALSE, Estep.output=FALSE, tolerance=1e-6)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{data}{a data frame or matrix}
  \item{weights}{sampling weights}
  \item{alpha}{probability for the quantile of the cut-off}
  \item{psi.par}{further parameters passed to the psi-function}
  \item{em.steps}{number of iteration steps of the EM-algorithm}
  \item{steps.output}{if \code{TRUE} verbose output}
  \item{Estep.output}{if \code{TRUE} estimators are output at each iteration}
  \item{tolerance}{convergence criterion (relative change)}
}
\details{
The M-step of the EM-algorithm uses a one-step M-estimator.
}
\value{
  \item{sample.size }{number of observations}
  \item{number.of.variables }{Number of variables}
  \item{significance.level}{\code{alpha}}
  \item{computation.time}{Elapsed computation time}
  \item{good.data}{Indices of the data in the final good subset}
  \item{outliers}{Indices of the outliers}
  \item{center}{Final estimate of the center}
  \item{scatter}{Final estimate of the covariance matrix}
  \item{dist}{Final Mahalanobis distances}
  \item{rob.weights}{Robustness weights in the final EM step}
}
\references{Little, R. and P. Smith (1987). 
Editing and imputation for quantitative survey data.
Journal of the American Statistical Association, 82, 58-68.}

\author{Beat Hulliger}

\seealso{\code{\link{BEM}}}
\examples{
data(bushfirem)
data(bushfire.weights)
det.res<-ER(bushfirem, weights=bushfire.weights,alpha=0.05,steps.output=TRUE,em.steps=100,tol=2e-6)
PlotMD(det.res$dist,ncol(bushfirem))
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{robust}
\keyword{survey}
\keyword{multivariate}% __ONLY ONE__ keyword per line
