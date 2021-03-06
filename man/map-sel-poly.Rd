\name{map.sel.poly}
\alias{map.sel.poly}
\title{Interactively select a polygon (grid graphics) and highlight points}
\usage{
  map.sel.poly(data, pch = 19, size = 0.3, ...)
}
\arguments{
  \item{data}{hyperSpec object for plotting map}

  \item{pch}{symbol to display the points of the polygon
  for \code{\link{sel.poly}}}

  \item{size}{size for polygon point symbol for
  \code{\link{sel.poly}}}

  \item{\dots}{further arguments for
  \code{\link[grid]{grid.points}} and
  \code{\link[grid]{grid.lines}}}
}
\value{
  array of indices for points within selected polygon
}
\description{
  Click the points that should be connected as polygon.
  Input ends with right click (see
  \code{\link[grid]{grid.locator}}). Polygon will be drawn
  closed. Wrapper for \code{\link{plotmap}},
  \code{\link{sel.poly}}, and
  \code{\link[sp]{point.in.polygon}}.
}
\examples{
\donttest{
map.sel.poly (chondro)
}
}
\author{
  Claudia Beleites, Sebastian Mellor
}
\seealso{
  \code{\link[grid]{grid.locator}}, \code{\link{sel.poly}},
  \code{\link{map.identify}}
}
\keyword{iplot}

