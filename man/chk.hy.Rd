\name{chk.hy}
\alias{chk.hy}
\alias{validObject}
\alias{validObject,hyperSpec-method}
\title{Validation of hyperSpec objects}
\usage{
  chk.hy(object)
}
\arguments{
  \item{object}{the object to check}
}
\value{
  \code{TRUE} if the check passes, otherwise stop with an
  error.
}
\description{
  Check whether an object is a hyperSpec object and
  validate the object
}
\examples{
chk.hy (chondro)
validObject (chondro)
}
\author{
  C. Beleites
}
\seealso{
  \code{\link[methods]{validObject}}
}
\keyword{methods}

