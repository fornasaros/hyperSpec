\name{rmmvnorm}
\alias{rmmvnorm}
\alias{rmmvnorm,numeric,hyperSpec,array-method}
\alias{rmmvnorm,numeric,hyperSpec,matrix-method}
\alias{rmmvnorm,numeric,matrix,array-method}
\alias{rmmvnorm,numeric,matrix,matrix-method}
\title{Multivariate normal random numbers}
\usage{
  \S4method{rmmvnorm}{numeric,hyperSpec,matrix}(n, mean,
    sigma)

  \S4method{rmmvnorm}{numeric,hyperSpec,array}(n, mean,
    sigma)

  \S4method{rmmvnorm}{numeric,matrix,matrix}(n, mean,
    sigma)

  \S4method{rmmvnorm}{numeric,matrix,array}(n, mean, sigma)
}
\arguments{
  \item{n}{vector giving the numer of cases to generate for
  each group}

  \item{mean}{matrix with mean cases in rows}

  \item{sigma}{common covariance matrix or array
  (\code{ncol (mean)} x \code{ncol (mean)} x \code{nrow
  (mean)}) with individual covariance matrices for the
  groups.}
}
\description{
  Interface functions to use \code{\link[mvtnorm]{rmvnorm}}
  for \code{\link[hyperSpec]{hyperSpec-class}} objects.
}
\details{
  The \code{mvtnorm} method for hyperSpec objects supports
  producing multivariate normal data for groups with
  different mean but common covariance matrix, see the
  examples.
}
\examples{
## multiple groups, common covariance matrix

pcov <- pooled.cov (chondro, chondro$clusters)
rnd <- rmmvnorm (rep (10, 3), mean = pcov$mean, sigma = pcov$COV)
plot (rnd, col = rnd$.group)
}
\seealso{
  \code{\link[mvtnorm]{rmvnorm}}

  \code{\link[hyperSpec]{cov}} and
  \code{\link[hyperSpec]{pooled.cov}} about calculating
  covariance of hyperSpec objects.
}

