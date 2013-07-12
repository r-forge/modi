\name{POEM}
\alias{POEM}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Nearest Neighbour Imputation with Mahalanobis distance }
\description{
 POEM takes into account missing values, outlier indicators, error indicators and sampling weights.
}
\usage{
POEM(data, weights, outind, errors, missing.matrix, alpha = 0.5, beta = 0.5, reweight.out = FALSE, c = 5, preliminary.mean.imputation = FALSE, monitor=FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{data}{a data frame or matrix with the data}
  \item{weights}{sampling weights }
  \item{outind}{an indicator vector for the outliers, 1 indicating outlier}
  \item{errors}{matrix of indicators for items which failed edits}
  \item{missing.matrix}{ the missingness matrix can be given as input. Otherwise it will be recalculated }
  \item{alpha}{scalar giving the weight attributed to an item that is failing }
  \item{beta}{minimal overlap to accept a donor}
  \item{reweight.out}{ if \code{TRUE} the outliers are redefined }
  \item{c}{ tuning constant when redefining the outliers (cutoff for Mahalanobis distances) }
  \item{preliminary.mean.imputation}{assume the problematic observation is at the mean of good observations }
  \item{monitor}{ if \code{TRUE} verbose output }
}
\details{ POEM assumes that an multivariate outlier detection has been carried out beforehand and assumes the 
result is summarized in the vectore \code{outliers}. 
Preliminary mean imputation is sometimes needed to avoid a non-positive definite covariance estimate. 
It assumes that the problematic values of an observation (with errors, outliers or missing) can be replace by 
the mean of the rest of the non-problematic observations. 
}
\value{The result is given in two global lists: \code{POEM.r} contains the information 
on POEM and \code{POEM.i} contains the imputed data}
\references{B\'{e}guin, C. and Hulliger B., (2002),
 EUREDIT Workpackage x.2 D4-5.2.1-2.C
Develop and evaluate new methods for statistical outlier 
 detection and outlier robust multivariate imputation,
Technical report, EUREDIT 2002.
 }
\author{ Beat Hulliger}

\examples{
data(bushfirem)
data(bushfire.weights)
outliers<-rep(0,nrow(bushfirem))
outliers[31:38]<-1
POEM(bushfirem,bushfire.weights,outliers,prel=TRUE)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{robust}
\keyword{multivariate}
\keyword{survey}
% __ONLY ONE__ keyword per line
