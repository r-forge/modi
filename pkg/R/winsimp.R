winsimp <-
function(data,center,scatter,outind,seed=1000003)
# Imputation under the multivariate normal model after winsorization
# Beat Hulliger
# 22.5.2009, 7.8.2009


{
############ Computation time start ############
#
	calc.time <- proc.time()
	
outind<-as.logical(outind)
# Mahalanobis distance
data.wins <- as.matrix(data)
MD<-sqrt(mahalanobis(data.wins,center,scatter))
cutpoint<-min(MD[outind])
# robustness weight
u <- ifelse(MD <=cutpoint,1,cutpoint/MD)
#  winsorization for outliers
data.wins[outind,] <- as.matrix(sweep(sweep(sweep(data[outind,],2,center,'-'),
                                               1,u[outind],'*'),
									2,center,'+'))
# imputation for missing values
rngseed(seed)
s <- prelim.norm(data.wins)
data.imp<-imp.norm(s,makeparam.norm(s,list(center,scatter)),data.wins)

if (sum(is.na(data.imp))>0) cat("There are missing values in the imputed data set.\n")
#
############ Computation time stop ############
#
	calc.time <- proc.time() - calc.time
#
############ Results ############
#

winsimp.r <<-  list(cutpoint=cutpoint, proc.time = calc.time, n.missing.before=sum(is.na(data)),n.missing.after=sum(is.na(data.imp)))
winsimp.i <<-  data.imp
cat("Results are in winsimp.r and the imputed data is in winsimp.i")

}
