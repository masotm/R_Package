\name{fbab}
\alias{fbab}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
fbab(date, prices, freq, holdingperiod, mkt)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{date}{
%%     ~~Describe \code{date} here~~
}
  \item{prices}{
%%     ~~Describe \code{prices} here~~
}
  \item{freq}{
%%     ~~Describe \code{freq} here~~
}
  \item{holdingperiod}{
%%     ~~Describe \code{holdingperiod} here~~
}
  \item{mkt}{
%%     ~~Describe \code{mkt} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (date, prices, freq, holdingperiod, mkt) 
{
    retper <- f.rendperc(prices)
    rmkt <- mkt[-length(mkt)]/mkt[-1] - 1
    r <- estimateextractor(retper, holdingperiod, freq)
    m <- estimateextractor(rmkt, holdingperiod, freq)
    d <- estimateextractor(date[-1], holdingperiod, freq)
    da <- d[[1]][length(d[[1]])]
    beta <- var(cbind(m[[1]], r[[1]]))[, 1][-1]/var(cbind(m[[1]], 
        r[[1]]))[, 1][1]
    for (i in 2:length(d)) {
        da <- c(da, d[[i]][length(d[[i]])])
        beta <- rbind(beta, var(cbind(m[[i]], r[[i]]))[, 1][-1]/var(cbind(m[[i]], 
            r[[i]]))[, 1][1])
    }
    l <- list(beta, da)
    names(l) <- c("mtx", "date")
    return(l)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
