\name{EAimp}
\title{Epidemic Algorithm for imputation of multivariate outliers in incomplete survey data.}
\alias{EAimp}
\description{
  After running EAdet an imputation of the detected outliers with EAimp may be run. 
}
\usage{
EAimp(data, weights ,  outind, reach,
duration = 5, maxl = 5, kdon = 1, monitor = FALSE, threshold = FALSE, deterministic = TRUE, fixedprop = 0)
}
\arguments{
  \item{data}{a data frame or matrix with the data}
  \item{weights}{a vector of positive sampling weights}
  \item{outind}{a logical vecotr with component TRUE for outliers}
  \item{maxl}{Maximum number of steps without infection}
  \item{reach}{reach of the threshold function (usually set to the maximum distance to a nearest neighbour, see internal function \code{.EA.dist})}
  \item{monitor}{if \code{TRUE} verbose output on epidemic}
  \item{threshold}{Infect all remaining points with infection probability above the threshold \code{1-0.5^(1/maxl)}}
  \item{deterministic}{if \code{TRUE} the number of infections is the expected number and 
  the infected observations are the ones with largest infection probabilities.} 
  \item{duration}{The duration of the detection epidemic}
  \item{kdon}{The number of donors that should be infected before imputation}
  \item{fixedprop}{If \code{TRUE} a fixed proportion of observations is infected at each step}
}

\details{\code{EAimp} uses the distances calculated in \code{EAdet} (actually the counterprobabilities, which are stored in a global data set) and starts an epidemic at each observation to be imputed until donors for the missing values are infected. Then a donor is selected randomly. }

\value{
\code{EAimp} returns a list with components \code{parameters} and \code{imputed.data}.

\code{parameters} contains the following components:
\item{sample.size}{Number of observations}
\item{number.of.variables}{Number of variables}
\item{n.complete.records}{Number of records without missing values}
\item{n.usable.records}{Number of records with less than half of values missing (unusable observations are discarded)}
\item{duration}{Duration of epidemic}
\item{reach}{Transmission distance (d0)}
\item{threshold}{Input parameter}
\item{deterministic}{Input parameter}
\item{computation.time}{Elapsed computation time}

\code{imputed.data} contains the imputed data.
  }
  \references{B\'{e}guin, C., and Hulliger, B. (2004). Multivariate oulier detection in
incomplete survey data: The epidemic algorithm and transformed
rank correlations. Journal of the Royal Statistical Society, A
167(Part 2.), 275-294.}
\author{Beat Hulliger}
\seealso{ \code{\link{EAdet}} for outlier detection with the Epicemic Algorithm.}
\examples{
data(bushfirem,bushfire.weights)
det.res<-EAdet(bushfirem,bushfire.weights)
imp.res<-EAimp(bushfirem,bushfire.weights,outind=det.res$outind,
reach=det.res$output$max.min.di,kdon=3)
print(imp.res$output)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{survey}
\keyword{robust}
\keyword{multivariate}
% __ONLY ONE__ keyword per line
