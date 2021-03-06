\docType{methods}
\name{ncol}
\alias{dim}
\alias{dim,hyperSpec-method}
\alias{length}
\alias{length,hyperSpec-method}
\alias{ncol}
\alias{ncol,hyperSpec-method}
\alias{nrow}
\alias{nrow,hyperSpec-method}
\alias{nwl}
\title{The Number of Rows (Spectra), Columns, and Data Points per Spectrum of an
hyperSpec Object)}
\usage{
  \S4method{ncol}{hyperSpec}(x)

  \S4method{nrow}{hyperSpec}(x)

  nwl(x)

  \S4method{dim}{hyperSpec}(x)

  \S4method{length}{hyperSpec}(x)
}
\arguments{
  \item{x}{a \code{hyperSpec} object}
}
\value{
  \code{nrow}, \code{ncol}, \code{nwl}, and \code{length},
  return an \code{integer}.

  \code{dim} returns a vector of length 3.
}
\description{
  \code{ncol} returns the number of columns in
  \code{x@data}. I.e. the number of columns with additional
  information to each spectrum (e.g. "x", "y", \dots{}) + 1
  (for column \code{spc} containing the spectra).

  \code{nrow} yields the number of rows in \code{x@data},
  i.e. the number of spectra in the \code{hyperSpec}
  object.

  \code{nwl} returns the number of columns in
  \code{x@data$spc}, i.e. the length of each spectrum.

  \code{dim} returns all three values in a vector.

  \code{length} is a synonym for \code{nrow}. It is
  supplied so that \code{seq_along (x)} returns a sequence
  to index each spectrum.
}
\examples{
ncol (chondro)
nrow (chondro)
nwl  (chondro)
dim (chondro)
length (chondro)
}
\author{
  C. Beleites
}
\seealso{
  \code{\link[base]{ncol}}

  \code{\link[base]{nrow}}

  \code{\link[base]{dim}}

  \code{\link[base]{length}}
}
\keyword{methods}

