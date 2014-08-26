\name{EAdet}
\title{Epidemic Algorithm for detection of multivariate outliers in incomplete survey data.}
\alias{EAdet}
\description{
  In EAdet an epidemic is started at a center of the data. 
  The epidemic spreads out and infects neighbouring points (probabilistically or deterministiaclly). 
  The last points infected are outliers. After running EAdet an imputation with EAimp may be run. 
  }
\usage{
EAdet(data, weights, reach = "max", transmission.function = "root", power = ncol(data), distance.type = "euclidean", global.distances = F, maxl = 5, plotting = T, monitor = F, prob.quantile = 0.9, random.start = F, fix.start, threshold = F, deterministic = TRUE, remove.missobs=FALSE,verbose=F)
}
\arguments{
  \item{data}{a data frame or matrix with the data}
  \item{weights}{a vector of positive sampling weights}
  \item{reach}{if \code{reach="max"} the maximal nearest neighbour distance is used as the basis for the 
  transmission function,  
  otherwise the weighted \code{(1-(p+1)/n)} quantile of the nearest neighbour distances is used.}
  \item{transmission.function}{form of the transmission function of distance \code{d}: 
  \code{"step"} is a heaviside function which jumps to \code{1} at \code{d0}, 
  \code{"linear"} is linear between \code{0} and \code{d0}, 
  \code{"power"} is \code{(beta*d+1)^(-p)} for \code{p=ncol(data)} as default, 
  \code{"root"} is the function \code{1-(1-d/d0)^(1/maxl)}}
  \item{power}{sets \code{p=power}}
  \item{distance.type}{distance type in function \code{dist()}}
  \item{global.distances}{if \code{TRUE} uses the global distance stored in EA.distances instead, otherwise calculates the distances freshly}
  \item{maxl}{Maximum number of steps without infection}
  \item{plotting}{if \code{TRUE} the cdf of infection times is plotted}
  \item{monitor}{if \code{TRUE} verbose output on epidemic}
  \item{prob.quantile}{If mads fail take this quantile absolute deviation}
  \item{random.start}{If \code{TRUE} take a starting point at random instead of the spatial median}
  \item{fix.start}{Force epidemic to start at a specific observation}
  \item{threshold}{Infect all remaining points with infection probability above the threshold \code{1-0.5^(1/maxl)}}
  \item{deterministic}{if \code{TRUE} the number of infections is the expected number and 
  the infected observations are the ones with largest infection probabilities.}
  \item{remove.missobs}{Set \code{remove.missobs} to \code{TRUE} if completely missing observations should be discarded. This has to done actively as a safeguard to avoid mismatches when imputing.} 
  \item{verbose}{More output.}
}
\details{
  The form and parameters of the transmission function should be chosen such that the infection times have 
  at least a range of 10. The default cutting point to decide on outliers is the median infection time plus three times 
  the mad of infection times. A better cutpoint may be chosen by visual inspection of the cdf of infection times. 

\code{EAdet} with \code{global.distances=F} calls the function \code{EA.dist}, which stores the counterprobabilities of infection in a global variable \code{EA.distances} and three parameters (sample spatial median index, maximal distance to nearest neighbor and transmission distance=reach) in \code{EA.distances.parameters} (The distances vector often is too large to be passed as arguments). 
}
\value{
 \code{EAdet} returns a list whose first component \code{output} is a sub-list with the following components:

\item{sample.size}{Number of observations}
\item{discarded.ovbservations}{Number of discarded observations}
\item{number.of.variables}{Number of variables}
\item{n.complete.records}{Number of records without missing values}
\item{n.usable.records}{Number of records with less than half of values missing (unusable observations are discarded)}
\item{medians}{Component wise medians}
\item{mads}{Component wise mads}
\item{prob.quantile}{Use this quantile if mads fail, i.e. if one of the mads is 0.}
\item{quantile.deviations}{Quantile of absolute deviations.}
\item{start}{Starting observation}
\item{transmission.function}{Input parameter}
\item{power}{Input parameter}
\item{maxl}{Maximum number of steps without infection}
\item{min.nn.dist}{maximal nearest neighbor distance}
\item{transmission.distance}{\code{d0}}
\item{threshold}{Input parameter}
\item{distance.type}{Input parameter}
\item{deterministic}{Input parameter}
\item{number.infected}{Number of infected observations}
\item{cutpoint}{Cutpoint of infection times for outlier definition}
\item{number.outliers}{Number of outliers}
\item{outliers}{Indices of outliers}
\item{duration}{Duration of epidemic}
\item{computation.time}{Elapsed computation time}
\item{initialisation.computation.time}{Elapsed compuation time for standardisation and calculation of distance matrix}

The further components returned by \code{EAdet} are:

  \item{infected}{Indicator of infection}
  \item{infection.time}{Time of infection}
  \item{outind}{Indicator of outliers}
  
}
  \references{B\'{e}guin, C., and Hulliger, B. (2004). Multivariate oulier detection in
incomplete survey data: The epidemic algorithm and transformed
rank correlations. Journal of the Royal Statistical Society, A
167(Part 2.), 275-294.}
\author{Beat Hulliger}
\seealso{\code{\link{EAimp}} for imputation with the Epidemic Algorithm.}
\examples{
data(bushfirem,bushfire.weights)
det.res<-EAdet(bushfirem,bushfire.weights)
print(det.res$output)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{survey}
\keyword{robust}
\keyword{multivariate}
% __ONLY ONE__ keyword per line
