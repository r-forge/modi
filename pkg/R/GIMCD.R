GIMCD <-
  function(data,alpha=0.05,seed=234567819)
    # run em and then mcd
    # Beat Hulliger, 2007
  {
  ############ Computation time start ############
#
	calc.time <- proc.time()
	
    rngseed(seed)
    if (!is.matrix(data)) data<-as.matrix(data)
    if (alpha<0.5) alpha<-1-alpha
    s <- prelim.norm(data)
    thetahat <- em.norm(s,showits=F)
    imp.data <- imp.norm(s,thetahat,data)
    MCD.cov<-cov.mcd(imp.data)
    gimcd.dist <-mahalanobis(imp.data,MCD.cov$center, MCD.cov$cov)
    n<-nrow(data)
    p<-ncol(data)
    gimcd.cutpoint <- qf(alpha,p,n-p)*median(gimcd.dist)/qf(0.5,p,n-p)
    gimcd.outind<-(gimcd.dist>gimcd.cutpoint)
    gimcd.outliers <- (1:nrow(data))[gimcd.dist>gimcd.cutpoint]
#
############ Computation time stop ############
#
	calc.time <- proc.time() - calc.time
#
############ Results ############
#	
	
cat("GIMCD has detected", sum(gimcd.outind),"outliers in", calc.time, "seconds.")
return(list(center=MCD.cov$center,scatter=MCD.cov$cov,
            alpha=1-alpha, computation.time = calc.time, 
            cutpoint = gimcd.cutpoint,
            outind=gimcd.outind,dist=gimcd.dist))
       
  }

