\name{decomposition}
\alias{decomposition}
\title{Convert Principal Component Decomposition or the like into a hyperSpec Object}
\usage{
  decomposition(object, x, wavelength = seq_len(ncol(x)),
    label.wavelength, label.spc, scores = TRUE,
    retain.columns = FALSE, short = "decomposition",
    user = NULL, date = NULL, ...)
}
\arguments{
  \item{object}{A \code{hyperSpec} object.}

  \item{x}{matrix with the new content for
  \code{object@data$spc}.

  Its size must correspond to rows (for \code{scores}) and
  to either columns or rows (for \code{loadings}) of
  \code{object}.}

  \item{wavelength}{for a scores-like \code{x}: the new
  \code{object@wavelength}.}

  \item{label.wavelength}{The new label for the wavelength
  axis (if \code{x} is scores-like)}

  \item{label.spc}{The new label for the spectra matrix}

  \item{scores}{is \code{x} a scores-like matrix?}

  \item{retain.columns}{for loading-like decompostition
  (i.e. \code{x} holds loadings, pure component spectra or
  the like), the data columns need special attention.

  Columns with different values across the rows will be set
  to \code{NA} if \code{retain.columns} is \code{TRUE},
  otherwise they will be deleted.}

  \item{short,user,date}{ignored: logbook is deprecated}

  \item{\dots}{ignored.}
}
\value{
  A \code{hyperSpec} object, updated according to \code{x}
}
\description{
  Decomposition of the spectra matrix is a common procedure
  in chemometric data analysis. \code{scores} and
  \code{loadings} convert the result matrices into new
  \code{hyperSpec} objects.
}
\details{
  Multivariate data are frequently decomposed by methods
  like principal component analysis, partial least squares,
  linear discriminant analysis, and the like.  These
  methods yield latent spectra (or latent variables,
  loadings, components, \dots{}) that are linear
  combination coefficients along the wavelength axis and
  scores for each spectrum and loading.

  The loadings matrix gives a coordinate transformation,
  and the scores are values in that new coordinate system.

  The obtained latent variables are spectra-like objects: a
  latent variable has a coefficient for each wavelength. If
  such a matrix (with the same number of columns as
  \code{object} has wavelengths) is given to
  \code{decomposition} (also setting \code{scores =
  FALSE}), the spectra matrix is replaced by \code{x}.
  Moreover, all columns of \code{object@data} that did not
  contain the same value for all spectra are set to
  \code{NA}.  Thus, for the resulting \code{hyperSpec}
  object, \code{\link{plotspc}} and related functions are
  meaningful. \code{\link[hyperSpec]{plotmap}} cannot be
  applied as the loadings are not laterally resolved.

  The scores matrix needs to have the same number of rows
  as \code{object} has spectra. If such a matrix is given,
  \code{decomposition} will replace the spectra matrix is
  replaced by \code{x} and \code{object@wavelength} by
  \code{wavelength}. The information related to each of the
  spectra is retained. For such a \code{hyperSpec} object,
  \code{\link{plotmap}} and \code{\link{plotc}} and the
  like can be applied. It is also possible to use the
  spectra plotting, but the interpretation is not that of
  the spectrum any longer.
}
\examples{
pca <- prcomp (flu)

pca.loadings <- decomposition (flu, t (pca$rotation), scores = FALSE)
pca.center <- decomposition (flu, pca$center, scores = FALSE)
pca.scores <- decomposition (flu, pca$x)

plot (pca.center)
plot (pca.loadings, col = c ("red", "gray50"))
plotc (pca.scores, groups = .wavelength)
}
\author{
  C. Beleites
}
\seealso{
  See \code{\link{\%*\%}} for matrix multiplication of
  \code{hyperSpec} objects.

  See e.g. \code{\link[stats]{prcomp}} and
  \code{\link[stats]{princomp}} for principal component
  analysis, and package \code{pls} for Partial Least
  Squares Regression.
}
\keyword{manip}
\keyword{methods}

