\docType{methods}
\name{plot-methods}
\alias{plot}
\alias{plot,ANY,ANY-method}
\alias{plot,hyperSpec,character-method}
\alias{plot,hyperSpec,missing-method}
\alias{plot-methods}
\title{Plotting hyperSpec Objects}
\usage{
  \S4method{plot}{hyperSpec,missing}(x, y, ...)

  \S4method{plot}{hyperSpec,character}(x, y, ...)
}
\arguments{
  \item{x}{the \code{hyperSpec} object}

  \item{y}{selects what plot should be produced}

  \item{\dots}{arguments passed to the respective plot
  function}
}
\description{
  Plotting \code{hyperSpec} objects. The \code{plot} method
  for \code{hyperSpec} objects is a switchyard to
  \code{\link{plotspc}}, \code{\link{plotmap}}, and
  \code{\link{plotc}}.
}
\details{
  It also supplies some convenient abbrevations for much
  used plots.

  If \code{y} is missing, \code{plot} behaves like
  \code{plot (x, y = "spc")}.

  Supported values for \code{y} are:

  \describe{ \item{"spc"}{calls \code{\link{plotspc}} to
  produce a spectra plot.}

  \item{"spcmeansd"}{plots mean spectrum +/- one standard
  deviation}

  \item{"spcprctile"}{plots 16th, 50th, and 84th percentile
  spectre. If the distributions of the intensities at all
  wavelengths were normal, this would correspond to
  \code{"spcmeansd"}. However, this is frequently not the
  case. Then \code{"spcprctile"} gives a better impression
  of the spectral data set.}

  \item{"spcprctl5"}{like \code{"spcprctile"}, but
  additionally the 5th and 95th percentile spectra are
  plotted.}

  \item{"map"}{calls \code{\link{plotmap}} to produce a map
  plot.}

  \item{"voronoi"}{calls \code{\link{plotvoronoi}} to
  produce a Voronoi plot (tesselated plot, like "map" for
  hyperSpec objects with uneven/non-rectangular grid).}

  \item{"mat"}{calls \code{\link{plotmat}} to produce a
  plot of the spectra matrix (not to be confused with
  \code{\link[graphics]{matplot}}).}

  \item{"c"}{calls \code{\link{plotc}} to produce a
  calibration (or time series, depth-profile, or the like)}

  \item{"ts"}{plots a time series: abbrevation for
  \code{\link{plotc} (x, use.c = "t")}}

  \item{"depth"}{plots a depth profile: abbrevation for
  \code{\link{plotc} (x, use.c = "z")}} }
}
\examples{
plot (flu)

plot (flu, "c")

plot (laser, "ts")

spc <- apply (chondro, 2, quantile, probs = 0.05)
spc <- sweep (chondro, 2, spc, "-")
plot (spc, "spcprctl5")
plot (spc, "spcprctile")
plot (spc, "spcmeansd")
}
\author{
  C. Beleites
}
\seealso{
  \code{\link{plotspc}} for spectra plots (intensity over
  wavelength),

  \code{\link{plotmap}} for plotting maps, i.e. color coded
  summary value on two (usually spatial) dimensions.

  \code{\link{plotc}}

  \code{\link[graphics]{plot}}
}
\keyword{hplot}
\keyword{methods}

