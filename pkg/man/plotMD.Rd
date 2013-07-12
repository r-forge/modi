\name{plotMD}
\alias{plotMD}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Plots Mahalanobis distances versus F-quantiles}
\description{
 QQ-plot vs. scaled F-distribution.
}
\usage{
plotMD(dist, p, alpha = 0.95)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dist}{ a vector of Mahalanobis distances }
  \item{p}{ the number of variables involved in the Mahalanobis distances}
  \item{alpha}{ a quantile for cut-off}
}
\details{
 median(dist)*qf((1:n)/(n+1),p,n-p)/qf(0.5,p ,n-p)
}
\value{
QQ-plot
}
\references{ ~put references to the literature/web site here ~ }
\author{Beat Hulliger}
