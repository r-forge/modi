\name{MDmiss}
\alias{MDmiss}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Mahalanobis distance (MD) for data with missing values. 
}
\description{
For each observation the missing dimensions are omitted before calculating the MD. The MD contains a correction factor \eqn{p/q} to account for the number of observed values, where \eqn{p} is the number of variables and \eqn{q} is the number of observed dimensions for the particular observation. 
}
\usage{
MDmiss(data, center, cov)
}
\arguments{
  \item{data}{
The data as a data frame or matrix.
}
  \item{center}{
The center to be used (may not contain missing values). 
}
  \item{cov}{
The covariance to be used (may not contain missing values).
}
}
\details{
The function loops over the observations. This is not optimal if only a few missingness patterns occur. If no missing values occur the function returns the Mahalanobis distance.}
\value{
The function returns a vector of the (squared) Mahalanobis distances.
}
\references{
B\'{e}guin, C., and Hulliger, B. (2004). Multivariate oulier detection in
incomplete survey data: The epidemic algorithm and transformed
rank correlations. Journal of the Royal Statistical Society, A
167(Part 2.), 275-294. 
}
\author{
Beat Hulliger
}

\seealso{
\code{\link{mahalanobis}}
}
\examples{
data(bushfirem,bushfire)
MDmiss(bushfirem,apply(bushfire,2,mean),var(bushfire))
}
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
