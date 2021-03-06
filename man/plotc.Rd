\name{plotc}
\alias{plotc}
\title{Calibration- and Timeseries Plots, Depth-Profiles and the like
\code{plotc} plots intensities of a \code{hyperSpec} object over another
dimension such as concentration, time, or a spatial coordinate.}
\usage{
  plotc(object, model = spc ~ c, groups = NULL,
    func = NULL, func.args = list(), ...)
}
\arguments{
  \item{object}{the \code{hyperSpec} object}

  \item{model}{the lattice model specifying the plot}

  \item{func}{function to compute a summary value from the
  spectra to be plotted instead of single intensities}

  \item{func.args}{further arguments to \code{func}}

  \item{groups}{grouping variable, e.g. \code{.wavelength}
  if intensities of more than one wavelength should be
  plotted}

  \item{\dots}{further arguments to
  \code{\link[lattice]{xyplot}}.}
}
\description{
  If \code{func} is not \code{NULL}, the summary
  characteristic is calculated first by applying
  \code{func} with the respective arguments (in
  \code{func.args}) to each of the spectra. If \code{func}
  returns more than one value (for each spectrum), the
  different values end up as different wavelengths.
}
\details{
  If the wavelength is not used in the model specification
  nor in \code{groups}, nor for specifying \code{subsets},
  and neither is \code{func} given, then only the first
  wavelength's intensities are plotted and a warning is
  issued.

  The special column names \code{.rownames} and
  \code{.wavelength} may be used.

  The actual plotting is done by
  \code{\link[lattice]{xyplot}}.
}
\examples{
## example 1: calibration of fluorescence
plotc (flu) ## gives a warning

plotc (flu, func = mean)
plotc (flu, func = range, groups = .wavelength)

plotc (flu[,,450], ylab = expression (I ["450 nm"] / a.u.))


calibration <- lm (spc ~ c, data = flu[,,450]$.)
summary (calibration)
plotc (flu [,, 450], type = c("p", "r"))

conc <- list (c = seq (from = 0.04, to = 0.31, by = 0.01))
ci <- predict (calibration, newdata = conc, interval = "confidence", level = 0.999)

panel.ci <-  function (x, y, ...,
                       conc, ci.lwr, ci.upr, ci.col = "#606060") {
   panel.xyplot (x, y, ...)
   panel.lmline (x, y,...)
   panel.lines (conc, ci.lwr, col = ci.col)
   panel.lines (conc, ci.upr, col = ci.col)
}

plotc (flu [,, 450], panel = panel.ci,
       conc = conc$c, ci.lwr = ci [, 2], ci.upr = ci [, 3])

## example 2: time-trace of laser emission modes
cols <- c ("black", "blue", "#008000", "red")
wl <- i2wl (laser, c(13, 17, 21, 23))

plotspc (laser, axis.args=list (x = list (at = seq (404.5, 405.8, .1))))
for (i in seq_along (wl))
   abline (v = wl[i], col = cols[i], lwd = 2)

plotc (laser [,, wl], spc ~ t, groups = .wavelength, type = "b",
       col = cols)
}
\author{
  C. Beleites
}
\seealso{
  \code{\link[lattice]{xyplot}}
}
\keyword{hplot}

