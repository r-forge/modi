\name{modi-internal}
\title{Internal Functions of modi-package}
\alias{modi-internal}
\description{
  The \code{modi-package} contains internal functions which are normally not called directly by the user. The internal functions are specifically built for the \code{modi-package} and are mainly used to improve efficiency and speed in the main functions of the package.
  
Calculation of distances for Epidemic Algorithm for multivariate outlier detection and imputation: 
\code{.EA.dist(data,n,p,weights,reach,transmission.function, power, distance.type, maxl)}

Non-zero non-missing minimum function:
\code{.nz.min(x)}

Addressing function for Epidemic Algorithm:
\code{.ind.dij(i, j, n)}

Addressing function for Epidemic Algorithm:
\code{.ind.dijs(i, js, n)}

Sum of weights for observations < value (if lt=T) or observations=value (if lt=F):
\code{.sum.weights(observations,weights,value,lt=TRUE)}

Definition of the sweep and reverse-sweep operator:
\code{.sweep.operator(M,k,reverse=FALSE) }

psi-function (defined in Little and Smith for ER algorithm):
\code{.psi.lismi(d,present,psi.par=c(2,1.25))}

EM for multivariate normal data:
\code{.EM.normal(data, weights=rep(1,nrow(data)), n=sum(weights) ,p=ncol(data), s.counts, s.id, S, T.obs, start.mean=rep(0,p),start.var=diag(1,p),numb.it=10,Estep.output=F)}


ER for multivariate normal data:
\code{.ER.normal(data, weights=rep(1,nrow(data)), psi.par=c(2,1.25), np=sum(weights) ,p=ncol(data), s.counts, s.id, S, missing.items, nb.missing.items, start.mean=rep(0,p),start.var=diag(1,p),numb.it=10,Estep.output=F,tolerance=1e-06)}

}
%\usage{}

\arguments{
  \item{data}{a data frame or matrix with the data}
  \item{n}{\code{nrow(data)}}
  \item{p}{\code{ncol(data)}}
  \item{weights}{a vector of positive sampling weights}
  \item{reach}{if \code{reach="max"} the maximal nearest neighbour distance is used as the basis for the 
  transmission function,  
  otherwise the weighted \eqn{(1-(p+1)/n)} quantile of the nearest neighbour distances is used.}
  \item{transmission.function}{form of the transmission function of distance \code{d}: 
  \code{"step"} is a heaviside function which jumps to \code{1} at \eqn{d0}, 
  \code{"linear"} is linearly decreasing from \eqn{1} to \eqn{0} between \eqn{0} and \eqn{d0}, 
  \code{"power"} is \eqn{(beta*d+1)^(-p)} with \eqn{p=ncol(data)} as default, 
  \code{"root"} is the function \eqn{1-(1-d/d0)^(1/maxl)}}
  \item{power}{sets \code{p=power}}
  \item{maxl}{Maximum number of steps without infection}
  \item{monitor}{if \code{TRUE} verbose output on epidemic}
  \item{x}{vector of numeric values}
  \item{i}{index for row}
  \item{j}{index for column}
  \item{js}{vector of indices of columns}
  \item{observations}{Number of observations}
  \item{value}{an integer, indicating the threshold for the sum of weights computation}
  \item{lt}{if TRUE, sum of weights for observations < \code{value} is returned. If FALSE, sum of weights for observations = \code{value} is returned}
  \item{M}{an array, including a matrix}
  \item{k}{a vector giving the subscripts which the function will be applied over. E.g., for a matrix 1 indicates rows, 2 indicates columns}
  \item{reverse}{logical value}
  \item{s.counts}{counts of the different missingness patterns ordered alphabetically}
  \item{s.id}{indices of the last observation of each missingness pattern in the dataset ordered by missingness pattern}
  \item{S}{total number of different missingness patterns}
  \item{T.obs}{Sufficient statistics on complete observations}
  \item{start.mean}{starting value for mean vector}
  \item{start.var}{starting value for variance vector}
  \item{numb.it}{number of iterations}
  \item{Estep.output}{logical, TRUE if verbose output is desired}
  \item{psi.par}{further parameters passed to the psi-function}
  \item{np}{population size}
  \item{missing.items}{Indices of missing items}
  \item{nb.missing.items}{number of missing items}
  \item{tolerance}{stop iterations when change is below tolerance}
  
}

\details{ \code{.EA.dist} creates a vector of length \eqn{n*(n-1)/2} in the global environment. To avoid memory problems this vector is not (!) passed as a function result. 
}
\value{A list with two components: The first component \code{output} is a list with components
\item{sample.spatial.median.index}{The index of the observation with minimal sum of absolute distances to all other points}
 \item{max.min.di}{The maximum distance to a nearest neighbour}
 \item{d0}{The reach of the transmission function}
 
 The second componentn is 
 \item{min.dist2nn}{A vector of the distances to the nearest neighbour}}
  \references{B\'{e}guin, C., and Hulliger, B. (2004). Multivariate oulier detection in
incomplete survey data: The epidemic algorithm and transformed
rank correlations. Journal of the Royal Statistical Society, A
167(Part 2.), 275-294.}
\author{C\'{e}dric B\'{e}guin, Beat Hulliger}
%\examples{}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{survey}
\keyword{robust}
\keyword{multivariate}
% __ONLY ONE__ keyword per line
