\docType{methods}
\name{scale,hyperSpec-method}
\alias{scale}
\alias{scale,hyperSpec-method}
\alias{scale-methods}
\title{Center and scale hyperSpec object}
\usage{
  \S4method{scale}{hyperSpec}(x, center = TRUE,
    scale = TRUE)
}
\arguments{
  \item{x}{the \code{hyperSpec} object}

  \item{center}{if \code{TRUE}, the data is centered to
  \code{colMeans (x)}, \code{FALSE} suppresses centering.
  Alternatively, an object that can be converted to numeric
  of length \code{nwl (x)} by \code{\link[base]{as.matrix}}
  (e.g. hyperSpec object containing 1 spectrum) can specify
  the center spectrum.}

  \item{scale}{if \code{TRUE}, the data is scaled to have
  unit variance at each wavelength, \code{FALSE} suppresses
  scaling. Alternatively, an object that can be converted
  to numeric of length \code{nwl (x)} by
  \code{\link[base]{as.matrix}} (e.g. hyperSpec object
  containing 1 spectrum) can specify the center spectrum.}
}
\value{
  the centered & scaled \code{hyperSpec} object
}
\description{
  \code{link[base]{scale}}s the spectra matrix. \code{scale
  (x, scale = FALSE)} centers the data.
}
\details{
  Package \code{scale} provides a fast alternative for
  \code{base::\link[base]{scale}}
}
\examples{
## mean center & variance scale
tmp <- scale (chondro)
plot (tmp, "spcmeansd")
plot (sample (tmp, 5), add = TRUE, col = 2)

## mean center only
tmp <- scale (chondro, scale = FALSE)
plot (tmp, "spcmeansd")
plot (sample (tmp, 5), add = TRUE, col = 2)

## custom center
tmp <- sweep (chondro, 1, mean, `/`)
plot (tmp, "spcmeansd")
tmp <- scale (tmp, center = quantile (tmp, .05), scale = FALSE)
}
\author{
  C. Beleites
}
\seealso{
  \code{\link[base]{scale}}

  package scale.
}
\keyword{methods}

