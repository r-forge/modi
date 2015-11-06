\name{POEM}
\alias{POEM}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Nearest Neighbour Imputation with Mahalanobis distance }
\description{
 POEM takes into account missing values, outlier indicators, error indicators and sampling weights.
}
\usage{
POEM(data, weights, outind, errors, missing.matrix, alpha = 0.5, beta = 0.5, 
reweight.out = FALSE, c = 5, preliminary.mean.imputation = FALSE, monitor=FALSE)
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
result is summarized in the vectore \code{outind}. In addition further observations may have been flagged as failing edit-rules and this information is given in the vector \code{error}. The mean and covariance estimate is calculated with the good observations (not outliers and downweighted errors). 
Preliminary mean imputation is sometimes needed to avoid a non-positive definite covariance estimate at this stage. 
Preliminary mean imputation assumes that the problematic values of an observation (with errors, outliers or missing) can be replaced by 
the mean of the rest of the non-problematic observations. Note that the algorithm imputes these problematic observations afterwards and therefore the final covariance matrix with imputed data is not the same as the working covariance matrix (which may be based on prelminary mean imputation).   
}
\value{Function \code{winsimp} returns a list whose first component \code{output} is a sub-list with the follwing components:

\item{preliminary.mean.imputation}{logical. \code{T} if preliminary mean imputation should be used}
\item{completely.missing}{number of observations with no observed values}
\item{good.values}{weighted number of of good values (not missing, not outlying, not erroneous)}
\item{nonoutliers.before}{number of nonoutliers before reweighting}
\item{weighted.nonoutliers.before}{weighted number of nonoutliers before reweighting}
\item{nonoutliers.after}{number of nonoutliers after reweighting}
\item{weighted.nonoutliers.after}{weighted number of nonoutliers after reweighting}
\item{old.center}{coordinate means after weighting, before imputation}
\item{old.variances}{coordinate variances after weighting, before imputation}
\item{new.center}{coordinate means after weighting, after imputation}
\item{new.variances}{coordinate variances after weighting, after imputation}
\item{covariance}{covariance (of standardised observations) before imputation}
\item{imputed.observations}{indices of observations with imputated values} 
\item{donors}{indices of donors for imputed observations}
\item{new.outind}{indices of new outliers}

The further component returned by \code{POEM} is 

\item{imputed.data}{Imputed data set.}
} 
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
imp.res<-POEM(bushfirem,bushfire.weights,outliers,prel=TRUE)
print(imp.res$output)
var(imp.res$imputed.data)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{robust}
\keyword{multivariate}
\keyword{survey}
% __ONLY ONE__ keyword per line
