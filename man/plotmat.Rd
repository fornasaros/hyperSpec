\name{plotmat}
\alias{plotmat}
\title{Plot spectra matrix}
\usage{
  plotmat(object, y = ".row", ylab,
    col = alois.palette(20), ..., contour = FALSE)
}
\arguments{
  \item{object}{hyperSpec object}

  \item{y}{character giving the name of the extra data
  column to label the y axis.}

  \item{ylab}{y axis label, defaults to \code{"row"} and
  the label of the extra data column used for the y axis,
  respectively.}

  \item{col}{see \code{\link[graphics]{image}}}

  \item{...}{further parameters for
  \code{\link[graphics]{image}}}

  \item{contour}{should \code{\link[graphics]{contour}} be
  called instead of \code{\link[graphics]{image}}?}
}
\description{
  plots the spectra matrix.
}
\details{
  If package plotrix is available, a color legend is
  plotted to the right. The right margin is set to at least
  5 lines.
}
\examples{
plotmat (laser, col = alois.palette (100))

plot (laser, "mat")

plotmat (laser)
plotmat (laser, contour = TRUE, add = TRUE)

## use different y axis labels

plotmat (laser, "t")

plotmat (laser, laser$t / 3600, ylab = "t / h")
}
\author{
  Claudia Beleites
}
\seealso{
  \code{\link[graphics]{image}},
  \code{\link[graphics]{contour}},
  \code{\link[hyperSpec]{levelplot}}
}

