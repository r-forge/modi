weighted.var <-
function (x, w, na.rm = FALSE) 
{
    if (missing(w)) 
        w <- rep.int(1, length(x))
    else if (length(w) != length(x)) 
        stop("x and w must have the same length")
    if (min(w)<0) stop("there are negative weights")
    if (is.integer(w)) 
        w <- as.numeric(w)
    if (na.rm) {
        w <- w[obs.ind <- !is.na(x)]
        x <- x[obs.ind]
    }
    w<-w*length(w)/sum(w)
    sum(w*(x-weighted.mean(x,w))^2)/(sum(w)-1)
}

