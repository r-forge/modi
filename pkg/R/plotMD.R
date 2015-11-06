PlotMD<- function(dist,p, alpha=0.95, chisquare=FALSE)
{
# QQ-Plot of (squared) Mahalanobis Distance 
	#dist[is.na(dist)]<-max(dist,na.rm=TRUE) #set missing distances to max
	dist<-dist[!is.na(dist)]
	n <- length(dist)
	if (!chisquare) {
    x <- median(dist)*qf((1:n)/(n+1),p,n-p)/qf(0.5,p ,n-p)
	} else {
	  x <- median(dist)*qchisq((1:n)/(n+1),p)/qchisq(0.5,p)
	}
  y<-sort(dist)
  if (!chisquare) {
    plot(x,y,ylab="MD-quantiles",xlab="F-quantiles")
    hmed <- median(dist)*qf(alpha,p,n-p)/qf(0.5,p,n-p)
    halpha <- sort(dist)[floor(alpha*n)]
  } else {
    plot(x,y,ylab="MD-quantiles",xlab="Chisquare-quantiles")
    hmed <- median(dist)*qchisq(alpha,p)/qchisq(0.5,p)
    halpha <- sort(dist)[floor(alpha*n)]
  }
  abline(h=hmed,lty=1)
  abline(h=halpha, lty=2)
  title(main="QQ-Plot of Mahalanobis distances")
        title ( sub=paste("alpha=",alpha,", hmed=",round(hmed,3),", halpha=",round(halpha,3)," n.miss.dist=",sum(is.na(dist))))
  return(list(hmed=hmed,halpha=halpha))
}
