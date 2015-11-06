\name{BEM}
\alias{BEM}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{BACON-EEM Algorithm for multivariate outlier detection in incomplete multivariate survey data}
\description{
  BEM starts from a set of uncontaminated data with possible missing values, applies a version of the EM-algorithm
  to estimate the center and scatter of the good data, then adds (or deletes) observations to the good data which have	 
  a Mahalanobis distance below a threshold. This process iterates until the good data remain stable. Observations not 
  among the good data are outliers.
}
\usage{
BEM(data, weights, v = 2, c0 = 3, alpha = 0.01, md.type = "m", 
em.steps.start = 10, em.steps.loop = 5, better.estimation = FALSE, monitor = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{data}{a matrix or data frame. As usual, rows are observations and columns are variables.}
  \item{weights}{a non-negative and non-zero vector of weights for each observation. 
  Its length must equal the number of rows of the data. Default is \code{rep(1,nrow(data))}.}
  \item{v}{an integer indicating the distance for the definition of the starting good subset: v=1 uses the Mahalanobis distance based 
  on the weighted mean and covariance, v=2 uses the Euclidean distance from the componentwise median}
  \item{c0}{the size of initial subset is c0*ncol(data).}
  \item{alpha}{a small probability indicating the level \code{(1-alpha)} of the cutoff quantile for good observations}
  \item{md.type}{Type of Mahalanobis distance: "m" marginal, "c" conditional}
  \item{em.steps.start}{Number of iterations of EM-algorithm for starting good subset}
  \item{em.steps.loop}{Number of iterations of EM-algorithm for good subset}
  \item{better.estimation}{If \code{better.estimation=TRUE} then the EM-algorithm 
  for the final good subset iterates \code{em.steps.start} more.}
  \item{monitor}{If \code{TRUE} verbose output.}
}
\details{
  The BACON algorithm with \code{v=1} is not robust but affine equivariant while \code{v=1} is robust but not affine equivariant. The threshold for the (squared) Mahalanobis distances, beyond which an observation is an outlier, is 
  a standardised chisquare quantile at \code{(1-alpha)}. For large data sets it may be better to choose \code{alpha/n} instead.

The internal function \code{.EM.normal} is usually called from \code{BEM}. \code{.EM.normal} is implementing the EM-algorithm in such a way that part of the calculations can be saved to be reused in the BEM algorithm. \code{.EM.normal} does not contain the computation of the observed sufficient statistics, they will be computed in the main program of \code{BEM} and passed as parameters as well as the statistics on the missingness patterns.
}

\value{\code{BEM} returns a list whose first component is the sub-list \code{output} with the following components: 
  \item{sample.size }{number of observations}
  \item{discarded.observations}{Number of discarded observations}
  \item{number.of.variables }{Number of variables}
  \item{significance.level}{the probability used for the cutpoint, i.e.\ \code{alpha}}
  \item{initial.basic.subset.size}{Size of initial good subset}
  \item{final.basic.subset.size}{Size of final good subset}
  \item{number.of.iterations}{Number of iterations of the BACON step}
  \item{computation.time}{Elapsed computation time}
  \item{center}{Final estimate of the center}
  \item{scatter}{Final estimate of the covariance matrix}
  \item{cutpoint}{The threshold MD-value for the cut-off of outliers}
  
The further components returned by \code{BEM} are:
   \item{outind}{Outlier indicator}
  \item{dist}{Final Mahalanobis distances}
}
\references{
B\'{e}guin, C. and Hulliger, B. (2008) The BACON-EEM Algorithm for Multivariate Outlier Detection 
in Incomplete Survey Data, \emph{Survey Methodology}, Vol. 34, No. 1, pp. 91-103.

Billor, N., Hadi, A.S. and Vellemann, P.F. (2000). BACON: Blocked
Adaptative Computationally-efficient Outlier Nominators. \emph{Computational Statistics and Data Analysis}, 
34(3), 279-298.

Schafer J.L. (2000),
\emph{Analysis of Incomplete Multivariate Data}, Monographs on Statistics and Applied Probability 72,
  Chapman & Hall.

}
\author{Beat Hulliger}
\note{ BEM uses an adapted version of the EM-algorithm in funkction \code{EM-normal.}
}

\examples{
# Bushfire data set with 20\% MCAR
data(bushfirem,bushfire.weights)
bem.res<-BEM(bushfirem,bushfire.weights,alpha=(1-0.01/nrow(bushfirem))) 
print(bem.res$output)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{robust}
\keyword{survey}
\keyword{multivariate}
% __ONLY ONE__ keyword per line
