GIMCD <-
  function(data,alpha=0.05,plotting=FALSE,seed=234567819)
    # run em and then mcd
    # Beat Hulliger, 2007
  {
  ############ Computation time start ############
#
	calc.time <- proc.time()
	
    require(norm)
    rngseed(seed)
    if (!is.matrix(data)) data<-as.matrix(data)
    if (alpha<0.5) alpha<-1-alpha
    s <- prelim.norm(data)
    thetahat <- em.norm(s)
    imp.data <- imp.norm(s,thetahat,data)
    MCD.cov<-cov.mcd(imp.data)
    gimcd.dist <-mahalanobis(imp.data,MCD.cov$center, MCD.cov$cov)
    n<-nrow(data)
    p<-ncol(data)
    if (plotting) plotMD(gimcd.dist,p,alpha=alpha)
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
    GIMCD.r<<-list(center=MCD.cov$center,scatter=MCD.cov$cov,alpha=1-alpha, computation.time = calc.time, outliers=gimcd.outliers,cutpoint = gimcd.cutpoint)
	GIMCD.i <<- list(outind=gimcd.outind,dist=gimcd.dist)
	
	cat("GIMCD has detected", sum(gimcd.outind),"outliers in", calc.time, "seconds.")
	cat("The results are in GIMCD.r and GIMCD.i")
  }

