plotMD<- function(dist,p, alpha=0.95)
{
# QQ-Plot of (squared) Mahalanobis Distance 
	#dist[is.na(dist)]<-max(dist,na.rm=T) #set missing distances to max
	dist<-dist[!is.na(dist)]
	n <- length(dist)
  x<-median(dist)*qf((1:n)/(n+1),p,n-p)/qf(0.5,p ,n-p)
  y<-sort(dist)
  plot(x,y,ylab="MD-quantiles",xlab="F-quantiles")
  hmed=median(dist)*qf(alpha,p,n-p)/qf(0.5,p,n-p)
  halpha=sort(dist)[floor(alpha*n)]
  abline(h=hmed,lty=1)
  abline(h=halpha, lty=2)
  title(main="QQ-Plot of Mahalanobis distances vs. F-distribution")
        title ( sub=paste("alpha=",alpha,", hmed=",round(hmed,3),", halpha=",round(halpha,3)," n.miss.dist=",sum(is.na(dist))))
  return(list(hmed=hmed,halpha=halpha))
}
