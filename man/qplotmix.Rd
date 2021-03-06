\name{legendright}
\alias{colmix.rgb}
\alias{legendright}
\alias{normalize.colrange}
\alias{normalize.minmax}
\alias{normalize.range}
\alias{qmixlegend}
\alias{qmixtile}
\title{Plot multivariate data into colour channels}
\usage{
  legendright(p, l, legend.width = 8,
    legend.unit = "lines")

  qmixtile(object,
    purecol = stop("pure component colors needed."),
    mapping = aes_string(x = "x", y = "y", fill = "spc"),
    ..., map.tileonly = FALSE)

  normalize.colrange(x, na.rm = TRUE, legend = FALSE,
    n = 100)

  normalize.range(x, na.rm = TRUE, legend = FALSE, n = 100)

  normalize.minmax(x, min = 0, max = 1, legend = FALSE,
    n = 100)

  qmixlegend(x, purecol, dx = 0.33, ny = 100,
    labels = names(purecol),
    normalize = normalize.colrange, ...)

  colmix.rgb(x, purecol, against = 1, sub = TRUE,
    normalize = normalize.colrange, ...)
}
\arguments{
  \item{p}{plot object}

  \item{l}{legend object}

  \item{legend.width,legend.unit}{size of legend part}

  \item{object}{matrix to be plotted with mixed colour
  channels}

  \item{purecol}{pure component colours, names determine
  legend labels}

  \item{mapping}{see \code{\link[ggplot2]{geom_tile}}}

  \item{\dots}{\code{qmixtile}: handed to \code{colmix.rgb}

  \code{qmixlegend}: handed to \code{normalize}

  \code{colmix.rgb}: handed to \code{normalize}}

  \item{map.tileonly}{if \code{TRUE}, \code{mapping} will
  be handed to \code{\link[ggplot2]{geom_tile}} instead of
  \code{\link[ggplot2]{ggplot}}.}

  \item{na.rm}{see \code{link[base]{min}}}

  \item{legend}{should a legend be produced instead of
  normalized values?}

  \item{n}{of colours to produce in legend}

  \item{min}{numeric with value corresponding to "lowest"
  colour for each column}

  \item{max}{numeric with value corresponding to "hightest"
  colour for each column}

  \item{dx}{width of label bar}

  \item{ny}{number of colours in legend}

  \item{labels}{component names}

  \item{x}{matrix with component intensities in columns}

  \item{against}{value to mix against (for \code{sub =
  TRUE} only, 1 = white, 0 = black)}

  \item{sub}{subtractive color mixing?}

  \item{normalize}{function to normalize the values.}
}
\value{
  invisible \code{NULL}

  list with components ymin, max and fill to specify value
  and fill colour value (still numeric!) for the legend,
  otherwise the normalized values

  ggplot object with legend

  character with colours
}
\description{
  plot graph with legend right of it

  plot multivariate data into colour channels using
  \code{\link[ggplot2]{geom_tile}}

  \code{normalize.colrange} normalizes the range of each
  column to [0, 1]

  \code{normalize.range} normalizes the range of all
  columns to [0, 1]

  \code{normalize.minmax} normalizes the range of each
  column j to [min_j, max_j]

  legends for mixed colour plots

  multi channel colour mixing
}
\author{
  Claudia Beleites

  Claudia Beleites

  Claudia Beleites
}

