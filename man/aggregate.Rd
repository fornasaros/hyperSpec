\docType{methods}
\name{aggregate}
\alias{aggregate}
\alias{aggregate,hyperSpec-method}
\alias{ave,hyperSpec-method}
\title{aggregate hyperSpec objects}
\usage{
  \S4method{aggregate}{hyperSpec}(x,
    by = stop("by is needed"),
    FUN = stop("FUN is needed."), ..., out.rows = NULL,
    append.rows = NULL, by.isindex = FALSE,
    short = "aggregate", date = NULL, user = NULL)
}
\arguments{
  \item{x}{a \code{hyperSpec} object}

  \item{by}{grouping for the rows of \code{x@data}.

  Either a list containing an index vector for each of the
  subgroups or a vector that can be \code{split} in such a
  list.}

  \item{FUN}{function to compute the summary statistics}

  \item{out.rows}{number of rows in the resulting
  \code{hyperSpec} object, for memory preallocation.}

  \item{append.rows}{If more rows are needed, how many
  should be appended?

  Defaults to 100 or an estimate based on the percentage of
  groups that are still to be done, whatever is larger.}

  \item{by.isindex}{If a list is given in \code{by}: does
  the list already contain the row indices of the groups?
  If \code{FALSE}, the list in \code{by} is computed first
  (as in \code{\link[stats]{aggregate}}).}

  \item{\dots}{further arguments passed to \code{FUN}}

  \item{short,date,user}{aguments passed to
  \code{\link[hyperSpec]{logentry}}}
}
\value{
  A \code{hyperSpec} object with an additional column
  \code{@data$.aggregate} tracing which group the rows
  belong to.
}
\description{
  aggregate Computes summary statistics for subsets of a
  \code{hyperSpec} object.
}
\details{
  \code{aggregate} applies \code{FUN} to each of the
  subgroups given by \code{by}. It combines the
  functionality of \code{\link[stats]{aggregate}},
  \code{\link[base]{tapply}}, and \code{\link[stats]{ave}}
  for hyperSpec objects.

  \code{aggregate} avoids splitting \code{x@data}.

  \code{FUN} does not need to return exactly one value.
  The number of returned values needs to be the same for
  all wavelengths (otherwise the result could not be a
  matrix), see the examples.

  If the initially preallocated \code{data.frame} turns out
  to be too small, more rows are appended and a warning is
  issued.
}
\examples{
cluster.means <- aggregate (chondro, chondro$clusters, mean_pm_sd)
plot(cluster.means, stacked = ".aggregate", fill = ".aggregate",
     col = matlab.dark.palette (3))

## make some "spectra"
spc <- new ("hyperSpec", spc = sweep (matrix (rnorm (10*20), ncol = 20), 1, (1:10)*5, "+"))

## 3 groups
color <- c("red", "blue", "black")
by <- as.factor (c (1, 1, 1, 1, 1, 1, 5, 1, 2, 2))
by
plot (spc, "spc", col = color[by])

## Example 1: plot the mean of the groups
plot (aggregate (spc, by, mean), "spc", col = color, add = TRUE,
      lines.args = list(lwd = 3, lty = 2))

## Example 2: FUN may return more than one value (here: 3)
plot (aggregate (spc, by, mean_pm_sd), "spc",
      col = rep(color, each = 3), lines.args = list(lwd = 3, lty = 2))

## Example 3: aggregate even takes FUN that return different numbers of
##            values for different groups
plot (spc, "spc", col = color[by])

weird.function <- function (x){
   if (length (x) == 1)
      x + 1 : 10
   else if (length (x) == 2)
      NULL
   else
      x [1]
}

agg <- aggregate (spc, by, weird.function)
agg$.aggregate
plot (agg, "spc",  add = TRUE, col = color[agg$.aggregate],
      lines.args = list (lwd = 3, lty = 2))
}
\author{
  C. Beleites
}
\seealso{
  \code{\link[base]{tapply}},
  \code{\link[stats]{aggregate}}, \code{\link[stats]{ave}}
}
\keyword{array}
\keyword{category}
\keyword{methods}

