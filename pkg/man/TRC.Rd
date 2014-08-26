\name{TRC}
\alias{TRC}
\title{Transformed rank correlations for multivariate outlier detection}
\description{
  \code{TRC} starts from bivariate Spearman correlations and obtains a positive definite covariance matrix by 
   back-transforming robust univariate medians and mads of the eigenspace. TRC can cope with missing values by a 
   regression imputation using the a robust regression on the best predictor and it takes sampling weights into account.
}
\usage{
TRC(data, weights, overlap = 3, mincor = 0, robust.regression = "rank", gamma = 0.5, prob.quantile = 0.75, alpha = 0.05, md.type = "m", monitor = F)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{data}{a data frame or matrix with the data}
  \item{weights}{sampling weights}
  \item{overlap}{minimum number of jointly observed values for calculating the rank correlation}
  \item{mincor}{minimal absolute correlation to impute}
  \item{robust.regression}{type of regression: "irls" is iteratively reweighted least squares M-estimator, "rank" is 
  based on the rank correlations}
  \item{gamma}{minimal number of jointly observed values to impute}
  \item{prob.quantile}{if mads are 0 try this quantile of absolute deviations}
  \item{alpha}{\code{(1-alpha)} Quantile of F-distribution is used for cut-off
}
  \item{md.type}{Type of Mahalanobis distance when missing values occur: "m" marginal (default), "c" conditional}
  \item{monitor}{if \code{TRUE} verbose output}
}
\details{
TRC is similar to a one-step OGK estimator where the starting covariances are obtained from rank correlations and an 
ad hoc missing value imputation plus weighting is provided.
}
\value{\code{TRC} returns a list whos first component \code{output} is a sublist with the follosing components: 
  \item{sample.size }{number of observations}
  \item{number.of.variables}{number of variables}
  \item{number.of.missing.items}{number of missing values}
  \item{significance.level}{\code{1-alpha}}
  \item{computation.time}{elapsed computation time}
  \item{medians}{componentwise medians}
  \item{mads}{componentwise mads}
  \item{center}{location estimate}
  \item{scatter}{covariance estimate}
  \item{robust.regression}{input parameter}
  \item{md.type}{input parameter}
  \item{cutpoint}{The threshold MD-value for the cut-off of outliers}

The further components returned by \code{TRC} are:
	
	\item{outind}{Indicator of outliers}
	\item{dist}{Mahalanobis distances (with missing values)}
}
\references{B\'{e}guin, C., and Hulliger, B. (2004). Multivariate oulier detection in
incomplete survey data: The epidemic algorithm and transformed
rank correlations. Journal of the Royal Statistical Society, A
167(Part 2.), 275-294. }
\author{ Beat Hulliger}

\examples{
data(bushfirem,bushfire.weights)
det.res<-TRC(bushfirem,weights=bushfire.weights)
print(det.res)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{robust}
\keyword{multivariate}
\keyword{survey}
% __ONLY ONE__ keyword per line
