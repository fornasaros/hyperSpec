\name{plotspc}
\alias{plotspc}
\alias{stacked.offsets}
\title{Plotting Spectra
Plot the spectra of a \code{hyperSpec} object, i.e. intensity over
wavelength. Instead of the intensity values of the spectra matrix summary
values calculated from these may be used.}
\usage{
  plotspc(object, wl.range = NULL, wl.index = FALSE,
    wl.reverse = FALSE, spc.nmax = 50, func = NULL,
    func.args = list(), stacked = NULL,
    stacked.args = list(), add = FALSE, bty = "l",
    plot.args = list(), col = "black", lines.args = list(),
    xoffset = 0, yoffset = 0, nxticks = 10,
    axis.args = list(), break.args = list(),
    title.args = list(), fill = NULL, fill.col = NULL,
    border = NA, polygon.args = list(),
    zeroline = list(lty = 2, col = col))

  stacked.offsets(x, stacked = TRUE, min.zero = FALSE,
    add.factor = 0.05, add.sum = 0, .spc = NULL)
}
\arguments{
  \item{object}{the \code{hyperSpec} object}

  \item{wl.range}{the wavelength range to be plotted.

  Either a numeric vector or a list of vectors with
  different wavelength ranges to be plotted separately.

  The values can be either wavelengths or wavelength
  indices (according to \code{wl.index}).}

  \item{wl.index}{if \code{TRUE}, \code{wl.range} is
  considered to give column indices into the spectra
  matrix. Defaults to specifying wavelength values rather
  than indices.}

  \item{wl.reverse}{if \code{TRUE}, the wavelength axis is
  plotted backwards.}

  \item{spc.nmax}{maximal number of spectra to be plotted
  (to avoid accidentally plotting of large numbers of
  spectra).}

  \item{func}{a function to apply to each wavelength in
  order to calculate summary spectra such as mean, min,
  max, etc.}

  \item{func.args}{\code{list} with furter arguments for
  \code{func}}

  \item{add}{if \code{TRUE}, the output is added to the
  existing plot}

  \item{bty}{see \code{\link[graphics]{par}}}

  \item{col}{see \code{\link[graphics]{par}}. \code{col}
  might be a vector giving individual colors for the
  spectra.}

  \item{xoffset}{vector with abscissa offsets for each of
  the \code{wl.range}s. If it has one element less than
  there are \code{wl.range}s, 0 is padded at the beginning.

  The values are interpreted as the distance along the
  wavelength axis that the following parts of the spectra
  are shifted towards the origin. E.g.  if \code{wl.range =
  list (600 ~ 1800, 2800 ~ 3200)}, \code{xoffset = 750}
  would result in a reasonable plot. See also the
  examples.}

  \item{yoffset}{ordinate offset values for the spectra.
  May be offsets to stack the spectra
  (\code{\link{stacked.offsets}}). Either one for all
  spectra, one per spectrum or one per group in
  \code{stacked}.}

  \item{nxticks}{hint how many tick marks the abscissa
  should have.}

  \item{stacked}{if not \code{NULL}, a "stacked" plot is
  produced, see the example. \code{stacked} may be
  \code{TRUE} to stack single spectra.  A numeric or factor
  is interpreted as giving the grouping, character is
  interpreted as the name of the extra data column that
  holds the groups.}

  \item{stacked.args}{a list with further arguments to
  \code{\link{stacked.offsets}}.}

  \item{fill}{if not \code{NULL}, the area between the
  specified spectra is filled with color \code{col}. The
  grouping can be given as factor or numeric, or as a
  character with the name of the extra data column to use.
  If a group contains more than 2 spectra, the first and
  the last are used.

  If \code{TRUE} spectra n and nrow (spc) - n build a
  group.}

  \item{fill.col}{character vector with fill color.
  Defaults to brightened colors from \code{col}.}

  \item{border}{character vector with border color. You
  will need to set the line color \code{col} to \code{NA}
  in order see the effect.}

  \item{plot.args}{\code{list} with further arguments to
  \code{\link[graphics]{plot}}}

  \item{axis.args}{\code{list} with further arguments for
  \code{\link[graphics]{axis}}. \code{axis.args$x} should
  contain arguments for plotting the abscissa,
  \code{axis.args$y} those for the ordinate (again as
  \code{lists}).}

  \item{title.args}{list with further arguments to
  \code{\link[graphics]{title}}.

  \code{title.args} may contain two lists, \code{$x}, and
  \code{$y} to set parameters individually for each axis.}

  \item{lines.args}{list with further arguments to
  \code{\link[graphics]{lines}}.

  \code{lines.args$type} defaults to "l".}

  \item{break.args}{list with arguments for
  \code{\link[plotrix]{axis.break}}.}

  \item{polygon.args}{list with further arguments to
  \code{\link[graphics]{polygon}} which draws the filled
  areas.}

  \item{zeroline}{\code{NA} or a list with arguments
  \code{\link[graphics]{abline}}, used to plot line (s)
  marking I = 0.

  \code{NA} suppresses plotting of the line.  The line is
  by default turned off if \code{yoffset} is not 0.}

  \item{x}{a \code{hyperSpec} object}

  \item{min.zero}{if \code{TRUE}, the lesser of zero and
  the minimum intensity of the spectrum is used as
  minimum.}

  \item{add.factor,add.sum}{proportion and absolute amount
  of space that should be added.}

  \item{.spc}{for internal use. If given, the ranges are
  evaluated on \code{.spc}. However, this may change in
  future.}
}
\value{
  \code{plotspc} invisibly returns a list with

  \item{x}{the abscissa coordinates of the plotted spectral
  data points}

  \item{y}{a matrix the ordinate coordinates of the plotted
  spectral data points}

  \item{wavelengths}{the wavelengths of the plotted
  spectral data points}

  This can be used together with
  \code{\link{spc.identify}}.

  a list containing \item{offsets}{numeric with the yoffset
  for each group in \code{stacked}} \item{groups}{numeric
  with the group number for each spectrum} \item{levels}{if
  \code{stacked} is a factor, the levels of the groups}
}
\description{
  This is \code{hyperSpec}'s main plotting function for
  spectra plots.

  Usually, the \code{stacked} argument of
  \code{\link[hyperSpec]{plotspc}} will do fine, but if you
  need fine control over the stacking, you may calculate
  the y offsets yourself.
}
\details{
  New plots are created by \code{\link[graphics]{plot}},
  but the abscissa and ordinate are drawn separately by
  \code{\link[graphics]{axis}}. Also,
  \code{\link[graphics]{title}} is called explicitly to set
  up titles and axis labels. This allows fine-grained
  customization of the plots.

  If package plotrix is available, its function
  \code{\link[plotrix]{axis.break}} is used to produce
  break marks for cut wavelength axes.

  Empty levels of the stacking factor are dropped (as no
  stacking offset can be calculated in that case.)
}
\examples{
plotspc (flu)

## artificial example to show wavelength axis cutting
plotspc (chondro [sample (nrow (chondro), 50)],
         wl.range = list (600 ~ 650, 1000 ~ 1100, 1600 ~ 1700),
         xoffset = c (0, 300, 450))

plotspc (chondro [sample (nrow (chondro), 50)],
         wl.range = list (600 ~ 650, 1000 ~ 1100, 1600 ~ 1700),
         xoffset = c (300, 450))

## some journals publish Raman spectra backwards
plotspc (chondro [sample (nrow (chondro), 50)], wl.reverse = TRUE)

plotspc (laser[(0:4)*20+1,,], stacked = TRUE)

plotspc (laser, func = mean_pm_sd,
         col = c(NA, "red", "black"), lines.args = list (lwd = 2),
         fill = c (1, NA, 1),
         fill.col = "yellow", border = "blue",
         polygon.args = list (lty = 2, lwd = 4),
         title.args = list (xlab = expression (lambda[emission] / nm),
                            y = list(line = 3.4),
                            col.lab = "darkgreen"),
         axis.args = list (x = list (col = "magenta"), y = list (las = 1))
        )

mean.pm.sd <- aggregate (chondro, chondro$clusters, mean_pm_sd)
plot (mean.pm.sd, col = matlab.palette (3), fill = ".aggregate", stacked = ".aggregate")
mean.pm.sd <- aggregate (chondro, chondro$clusters, mean_pm_sd)

offset <- stacked.offsets (mean.pm.sd, ".aggregate")
plot (mean.pm.sd, fill.col = matlab.palette (3), fill = ".aggregate",
      stacked = ".aggregate")

plot (aggregate (chondro, chondro$clusters, mean), yoffset = offset$offsets,
      lines.args = list (lty = 2, lwd = 2), add = TRUE)

barb <- do.call (collapse, barbiturates [1:3])
plot (barb, lines.args = list (type = "h"), stacked = TRUE,
      stacked.args = list (add.factor = .2))
}
\author{
  C. Beleites

  C. Beleites
}
\seealso{
  \code{\link[graphics]{plot}},
  \code{\link[graphics]{axis}},
  \code{\link[graphics]{title}},
  \code{\link[graphics]{lines}},
  \code{\link[graphics]{polygon}},
  \code{\link[graphics]{par}} for the description of the
  respective arguments.

  \code{\link[plotrix]{axis.break}} for cut marks

  See \code{\link{plot}} for some predefined spectra plots
  such as mean spectrum +/- one standard deviation and the
  like.

  \code{\link[graphics]{identify}} and
  \code{\link[graphics]{locator}} about interaction with
  plots.

  \code{\link[hyperSpec]{plotspc}}
}
\keyword{hplot}

