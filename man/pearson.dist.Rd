\name{pearson.dist}
\alias{pearson.dist}
\title{Distance based on Pearson's \eqn{R^2}{R squared}}
\usage{
  pearson.dist(x)
}
\arguments{
  \item{x}{a matrix}
}
\value{
  distance matrix (distance object)
}
\description{
  The calculated distance is \eqn{D^2 = \frac{1 - COR
  (\code{x}')}{2}}{D^2 = (1 - COR (x')) / 2}
}
\details{
  The distance between the rows of \code{x} is calculated.
  The possible values range from 0 (prefectly correlated)
  over 0.5 (uncorrelated) to 1 (perfectly anti-correlated).
}
\examples{
dist <- pearson.dist (flu[[]])
dist <- pearson.dist (flu)
}
\author{
  C. Beleites
}
\references{
  S. Theodoridis and K. Koutroumbas: Pattern Recognition,
  3rd ed., p. 495
}
\seealso{
  \code{\link[stats]{as.dist}}
}
\keyword{cluster}

