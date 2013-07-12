\name{sepe}
\alias{sepe}
\docType{data}
\title{Sample Environment Protection Expenditure Survey}
\description{
The sepe data set is a sample of the pilot survey  in 1993 of the Swiss Federal Statistical Office on environment protection expenditures of Swiss private economy in the previous accounting year. The units are enterprises, the monetary variables are in thousand Swiss Francs (CHF). From the original sample a random subsample was chosen of which certain enterprises were excluded for confidentiality reasons. In addition, noise has been added to certain variables, and certain categories have been collapsed. The data set has missing values. The data set has first been prepared for the FP5 project EUREDIT and later been data protected for educational purposes.  
}
\usage{data(sepe)}
\format{
  A data frame with 675 observations on 23 variables.
   \describe{
    \item{\code{idnr}}{identifier (anonymous)}
    \item{\code{exp}}{categoric variable: 1 = 'non-zero total expenditure', 2  = 'zero total expenditure', 3 = 'no answer to the question'}
    \item{\code{totinvwp}}{total investment for water protection}
    \item{\code{totinvwm}}{total investment for waste management}
    \item{\code{totinvap}}{total investment for air protection}
    \item{\code{totinvnp}}{total investment for noise protection}
    \item{\code{totinvot}}{total investement for other environmental protection areas}
    \item{\code{totinvto}}{overall total investment in all environmental protection areas}
    \item{\code{totexpxx}}{total current expenditure in environmental protectiona area xx (see investement variables above)}
    \item{\code{subtot}}{total subsidies for environmental protection received}
	\item{\code{rectot}}{total receipts from environmental protection}
    \item{\code{employ}}{number of employees}
	\item{\code{sizeclass}}{size class (according to number of employees)}
    \item{\code{stratum}}{stratum number of sample design}
	\item{\code{activity}}{code of economic activity (aggregated)}
    \item{\code{popsize}}{number of enterprises in the population-stratum}	
	\item{\code{popempl}}{number of employees in population activity group}
    \item{\code{weight}}{sampling weight (for extrapolation to the population)}
  }
}
\details{
The sample design is stratified random sampling with different sampling rates. Use package \pkg{survey} or \pkg{sampling} to obtain correct point and variance estimates. In addition a ratio estimator may be built using the variable \code{popemple} which gives the total employment per \code{activity}. 

There are two balance rules: the subtotals of the investment variables should sum to \code{totinvto} and the expenditure subtotals  should sum to \code{totexpto}. 

The missing values stem from the survey itself. In the actual survey the missing values were declared as ''guessed'' rather than copied from records. 

The sampling weight \code{weight} is adjusted for non-response in the stratum, i.e. \code{weight=popsize/sampsize}. 
}
\references{
Swiss Federal Statistical Office (1996), Umweltausgaben und -investitionen in der Schweiz 1992/1993, Ergebnisse einer Pilotstudie.

Charlton, J. (ed.), Towards Effective Statistical Editing and Imputation Strategies -
	Findings of the Euredit project, unpublished manuscript available from Eurostat and http://www.cs.york.ac.uk/euredit/
	
}
\examples{
data(sepe)
## maybe str(sepe) ; plot(sepe) ...
}
\keyword{datasets, multivariate, outliers, enterprise, missing values}
