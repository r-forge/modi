EAdet <-
function(data, weights ,reach="max", transmission.function = "root", power=ncol(data), distance.type = "euclidean", 
	global.distances=FALSE, maxl = 5, plotting = TRUE, monitor = FALSE, prob.quantile = 0.9, 
	random.start = FALSE, fix.start, threshold=FALSE, deterministic=TRUE, remove.missobs=FALSE)
{
# EPIDEMIC Algorithm for Multivariate Outlier Detection
#
# Béguin, C. and Hulliger, B. (2004) Multivariate outlier detection in incomplete survey data: 
# the epidemic algorithm and transformed rank correlations, JRSS-A, 167, Part 2, pp. 275–294.
#
# Program by Cédric Béguin and Beat Hulliger 
# Created : Wednesday, January 24, 2001
# Last modification : 4 August 2009 Beat Hulliger
# Conversion to R from EA030313.ssc by Beat Hulliger (4.7.2003)
# Modular programming and packaging: Beat Hulliger 27.3.2009 
# Copyright Swiss Federal Statistical Office and EUREDIT 2001-2006, FHNW 2007-2009
############ Dimensions ############
#
#

#
if (!is.matrix(data)) data<-as.matrix(data)
n <- nrow(data)
p <- ncol(data)
if (missing(weights)) weights <- rep(1,n)
# Removing the unit(s) with all items missing
new.indices <- which(apply(is.na(data),1,prod)==0)
discarded<-NA
nfull<-n
if ((length(new.indices)<n) & remove.missobs)
{
	discarded<-which(apply(is.na(data),1,prod)==1)
    cat("Warning: missing observations",discarded,"removed from the data\n")
    data <- data[new.indices,]
    weights <- weights[new.indices]
    n <- nrow(data)
}
	complete.records <- apply(!is.na(data), 1, prod)
	usable.records <- apply(!is.na(data), 1, sum) >= p/2
	cat("\n Dimensions (n,p):", n, p)
	cat("\n Number of complete records ", sum(complete.records))
	cat("\n Number of records with maximum p/2 variables missing ", sum(usable.records),"\n")
	power <- as.single(power)
#
# Standardization of weights
#
	np <- sum(weights)
	weights <- as.single((n * weights)/np)	#
#
############ Computation time start ############
#
	calc.time <- proc.time()[1]	#
############ Calibraton and setup ############
#
	medians <- apply(data, 2, weighted.quantile, w = weights, prob = 0.5)
	data <- sweep(data, 2, medians, "-")
	mads <- apply(abs(data), 2, weighted.quantile, w = weights, prob = 0.5)
	qads <- apply(abs(data), 2, weighted.quantile, w = weights, prob = prob.quantile)
	if(sum(mads == 0) > 0) {
		cat("\n Some mads are 0. Standardizing with ", prob.quantile, " quantile absolute deviations!")
		
		if(sum(qads == 0) > 0)
			cat("\n Some quantile absolute deviations are 0. No standardization!")
		else data <- sweep(data, 2, qads, "/")
	}
	else data <- sweep(data, 2, mads, "/")
	if(monitor) {
		standardized.data <<- data
	      cat("\n memory use after standardisation: ",memory.size())
	}
# Calculation of distances
if (global.distances==T) {
	EA.dist.par<-EA.distances.parameters
     cat("\n\n Global variable EA.distances used")
} else {
	EA.dist.par<-.EA.dist(data, n=n,p=p,weights = weights,reach=reach,
				transmission.function = transmission.function, power=power, distance.type = distance.type, 
				maxl = maxl, monitor = monitor,calc.time=calc.time)
	cat("\n\n Distances finished")
}
# The distances calculated by EA.dist are the counterprobabilities in single precision. 
# These counterprobabilities are stored as a global variable EA.distances to avoid copying this very large vector.
if (monitor) cat("\n memory use after distances: ",memory.size())
cat("\n Index of sample spatial median is ",EA.dist.par[1])
cat("\n Maximal distance to nearest neighbor is ", EA.dist.par[2])
cat("\n Transmission distance is ", EA.dist.par[3], "\n")
#
############ Initialisation ############
# 
	cat("\n\n Initialisation of epidemic")
	comp.time.init <- proc.time()[1] - calc.time
	if(monitor)
		cat("\n Initialisation time is ", comp.time.init)
	if(random.start)
		start.point <- sample(1:n, 1, prob = weights)
	else {
		if(!missing(fix.start))
			start.point <- fix.start
		else start.point <- EA.dist.par[1]
	}
	time <- 1
	infected <- rep(F, n)
	infected[c(start.point)] <- T
	new.infected <- infected
	n.infected <- sum(infected)
	hprod <- rep(1, n)
	
	infection.time <- rep(0, n)
	infection.time[c(start.point)] <- time	#
############ Main loop ############
#  
	repeat {
		if (monitor) cat("\n time = ", time, " , infected = ", n.infected)
		#print(memory.size())
		time <- time + 1
		old.infected <- infected
		if(sum(new.infected) > 1) {
		 hprod[!infected] <- hprod[!infected] *  apply(sweep(sweep(matrix(EA.distances[apply(as.matrix(which(!infected)),
				1, .ind.dijs, js = which(new.infected), n = n)], sum(new.infected), n - n.infected),1,
				weights[new.infected],"^" ),2,weights[!infected],"^"), 2, prod)
					
		}
		else {
			if(sum(new.infected) == 1)
				  hprod[!infected] <- hprod[!infected] * EA.distances[apply(as.matrix(which(!infected)), 1, 
				  .ind.dijs, js = which(new.infected), n = n)]^(weights[new.infected]* 
					weights[!infected])
			
		}
		if (deterministic) {
			n.to.infect <- sum(1 - hprod[!infected]) # HRK: expected number of infections
			# Do maxl trials for very small inf. prob.
			if (n.to.infect<0.5) n.to.infect <- sum(1 - hprod[!infected]^maxl) 
			n.to.infect<-round(n.to.infect)
			infected[!infected] <- rank(1 - hprod[!infected])>=n-n.infected-n.to.infect
		} else {
			if (threshold) {infected[!infected] <- hprod[!infected]<=0.5^(1/maxl)} else
		    infected[!infected] <- as.logical(rbinom(n - n.infected, 1, 1 - hprod[!infected]))}
		new.infected <- infected & (!old.infected)
		n.infected <- sum(infected)
		infection.time[new.infected] <- time
		if(n.infected == n) {
			break
		}
		if((time - max(infection.time)) > maxl) {
			break
		}
		next		
	}
	duration <- max(infection.time)
	if(monitor) {
		last.infection.prob <<- 1 - hprod
		cat("\n memory use after epidemic: ",memory.size())
	}
# 
############ Impute infection.time for not infected #############
# This is to show better the healthy on a graph of infection times
#
	infection.time[!infected] <- ceiling(1.2 * duration)	#
############ Computation time stop ############
#
	calc.time <- round(proc.time()[1] - calc.time, 5)
        med.infection.time <- weighted.quantile(infection.time,weights,0.5)
	mad.infection.time <- weighted.quantile(abs(infection.time-med.infection.time),weights,0.5)
	cat("\n med and mad of infection times: ",med.infection.time," and ",mad.infection.time)
	if (mad.infection.time==0) mad.infection.time <- med.infection.time
	cutpoint <- min(med.infection.time+3*mad.infection.time,duration)
	cat("\n Proposed cutpoint is ",min(cutpoint,duration))
        outlier.ind <- as.numeric(rownames(data))[which(infection.time>=cutpoint)]
# Blowing up to full length
infectedn<-logical(n)
infectedn[infected]<-TRUE
infectednfull<-logical(nfull)
if (nfull>n) infectednfull[new.indices]<-infectedn	else infectednfull<-infectedn	
time<-rep(NA,nfull)
if (nfull>n) time[new.indices]<-infection.time else time<-infection.time
outlier<-time>=cutpoint
#
############ Results ############
#
	EAdet.r <<- list(sample.size = n, discarded.observations=discarded, 
	                 number.of.variables = p, n.complete.records = sum(complete.records), 
		n.usable.records = sum(usable.records), medians = medians, mads = mads, prob.quantile = prob.quantile, 
		quantile.deviations = qads, start = start.point, transmission.function = transmission.function, power=power,
		maxl=maxl,
		min.nn.dist=EA.dist.par[2],	transmission.distance = EA.dist.par[3], threshold=threshold, distance.type = distance.type, 
		deterministic=deterministic, number.infected = n.infected, 
                cutpoint=cutpoint, number.outliers=sum(outlier), outliers=outlier.ind,
		duration = duration, computation.time = calc.time, initialisation.computation.time = comp.time.init)
	EAdet.i <<- list(infected = infectednfull, time = time, outind=outlier)
# plotting
	    if(plotting) {ord <- order(infection.time)
		plot(infection.time[ord],cumsum(weights[ord]), ylab = "cdf of infection time")
		abline(v=cutpoint)}	#

############ Output ############
#
	cat("\n", "EA detection has finished with", n.infected, "infected points in", calc.time, "seconds.")
		cat("\n The results are in EAdet.r and EAdet.i", "\n")
}

