.make.chondro <- function (){
  ## the data is in 
  new ("hyperSpec",
       spc =  (tcrossprod (.chondro.scores, .chondro.loadings) +
               rep (.chondro.center, each = nrow (.chondro.scores))),
       wavelength = .chondro.wl,
       data = .chondro.extra, labels = .chondro.labels)
}

##' Raman spectra of 2 Chondrocytes in Cartilage
##' A Raman-map (laterally resolved Raman spectra) of chondrocytes in
##' cartilage.
##' 
##' See the vignette.
##' 
##' @name chondro
##' @docType data
##' @format The data set has 796 Raman spectra measured on a 23 \eqn{\times}{x}
##'   35 grid with 1 micron step size. Spatial information is in
##'   \code{chondro$x} and \code{chondro$y}. Each spectrum has 300 data points
##'   in the range of ca. 600 - 1800 cm\eqn{^{-1}}{^-1}.
##' @author A. Bonifacio and C. Beleites
##' @keywords datasets
##' @references The raw data is available at \url{http://hyperspec.r-forge.r-project.org/blob/chondro.zip}
##' @export chondro
##' @examples
##' 
##' 
##' chondro
##' 
##' ## do baseline correction
##' baselines <- spc.fit.poly.below (chondro)
##' chondro <- chondro - baselines
##' 
##' ## area normalization
##' chondro <- chondro / colMeans (chondro)
##' 
##' ## substact common composition
##' chondro <- chondro - quantile (chondro, 0.05)
##' 
##' ## PCA
##' pca <- prcomp (~ spc, data = chondro, center = TRUE)
##' scores <- decomposition (chondro, pca$x, label.wavelength = "PC", label.spc = "score / a.u.")
##' loadings <- decomposition (chondro, pca$rotation, scores = FALSE, label.spc = "loading I / a.u.")
##' center <- decomposition (chondro, pca$center, scores = FALSE)
##' 
##' # remove outliers
##' out <- c(105, 140, 216, 289, 75, 69)
##' chondro <- chondro [- out]
##' 
##' # Hierarchical cluster analysis
##' # calculation omitted for speed - see vignette for details
##' 
##' cols <- c ("dark blue", "orange", "#C02020")
##' plotmap (chondro, clusters ~ x * y, col.regions = cols)
##' 
##' cluster.means <- aggregate (chondro, chondro$clusters, mean_pm_sd)
##' plot (cluster.means, stacked = ".aggregate", fill = ".aggregate", col = cols)
##' 
##' ## plot nucleic acids
##' plotmap (chondro[, , c( 728, 782, 1098, 1240, 1482, 1577)],
##'        col.regions = colorRampPalette (c("white", "gold", "dark green"), space = "Lab") (20))
##' 
##' \dontrun{vignette ("chondro", package = "hyperSpec")}
##' 
delayedAssign ("chondro", .make.chondro ())

