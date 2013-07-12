\name{EA}
\title{Epidemic Algorithm for imputation of multivariate outliers in incomplete survey data.}
\alias{EAimp}
\description{
  After running EAdet an imputation of the detected outliers with EAimp may be run. EAimp uses the distances calculated in EAdet and starts an epidemic at each observation to be imputed until donors for the missing values are infected. Then a donor is selected randomly. 
}
\usage{
EAimp(data, weights ,  outind=EAdet.i$outind, duration = EAdet.r$duration, maxl = 5, kdon = 1, monitor = FALSE, threshold = FALSE, deterministic = TRUE, fixedprop = 0)
}
\arguments{
  \item{data}{a data frame or matrix with the data}
  \item{weights}{a vector of positive sampling weights}
  \item{maxl}{Maximum number of steps without infection}
  \item{monitor}{if \code{TRUE} verbose output on epidemic}
  \item{threshold}{Infect all remaining points with infection probability above the threshold \code{1-0.5^(1/maxl)}}
  \item{deterministic}{if \code{TRUE} the number of infections is the expected number and 
  the infected observations are the ones with largest infection probabilities.} 
  \item{duration}{The duration of the detection epidemic}
  \item{outind}{a boolean vector indicating outliers}
  \item{kdon}{The number of donors that should be infected before imputation}
  \item{fixedprop}{If \code{TRUE} a fixed proportion of observations is infected at each step}
}
\details{
}
\value{
The output is stored in two global variables \code{EAimp.i} and \code{EAimp.r}. \code{EAimp.i} contains the imputed dataset and \code{EAimp.r} contains the following components:
\item{sample.size}{Number of observations}
\item{number.of.variables}{Number of variables}
\item{n.complete.records}{Number of records without missing values}
\item{n.usable.records}{Number of records with less than half of values missing (unusable observations are discarded)}
\item{duration}{Duration of epidemic}
\item{reach}{Transmission distance (d0)}
\item{threshold}{Input parameter}
\item{deterministic}{Input parameter}
\item{computation.time}{Elapsed computation time}
  }
  \references{B\'{e}guin, C., and Hulliger, B. (2004). Multivariate oulier detection in
incomplete survey data: The epidemic algorithm and transformed
rank correlations. Journal of the Royal Statistical Society, A
167(Part 2.), 275-294.}
\author{Beat Hulliger}
\examples{
data(bushfirem,bushfire.weights)
EAdet(bushfirem,bushfire.weights)
EAimp(bushfirem,mon=TRUE,kdon=3)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{survey}
\keyword{robust}
\keyword{multivariate}
% __ONLY ONE__ keyword per line
