\docType{methods}
\name{dimnames}
\alias{colnames}
\alias{colnames<-}
\alias{colnames<-,hyperSpec-method}
\alias{colnames,hyperSpec-method}
\alias{dimnames}
\alias{dimnames,hyperSpec-method}
\alias{rownames}
\alias{rownames<-}
\alias{rownames<-,hyperSpec-method}
\alias{rownames,hyperSpec-method}
\title{Dimnames for hyperSpec objects}
\usage{
  \S4method{dimnames}{hyperSpec}(x)

  \S4method{rownames}{hyperSpec}(x, do.NULL = TRUE,
    prefix = "row")

  \S4method{rownames}{hyperSpec} (x) <- value

  \S4method{colnames}{hyperSpec}(x, do.NULL = TRUE,
    prefix = "col")

  \S4method{colnames}{hyperSpec} (x) <- value
}
\arguments{
  \item{x}{the hyperSpec object}

  \item{do.NULL}{handed to \code{\link[base]{rownames}} or
  \code{\link[base]{colnames}}: logical. Should this create
  names if they are \code{NULL}?}

  \item{prefix}{handed to \code{\link[base]{rownames}} or
  \code{\link[base]{colnames}}}

  \item{value}{the new names}
}
\description{
  hyperSpec objects can have row- and column names like
  data.frames. The "names" of the wavelengths are treated
  separately: see \code{\link{wl}}
}
\examples{
dimnames (flu)
rownames (flu)
colnames (chondro)
}
\author{
  C. Beleites
}
\seealso{
  \code{\link{wl}} for the wavelength dimension

  \code{\link[base]{dimnames}}

  \code{\link[base]{rownames}}

  \code{\link[base]{colnames}}
}
\keyword{methods}

