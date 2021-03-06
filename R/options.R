.options <- list (log = FALSE,           # for .logentry
                  debuglevel = 0L,      # for spc.identify, map.identify
                  gc = FALSE            # frequent calling of gc in read.ENVI & initialize
                  )


##' Options for package hyperSpec
##' Functions to access and set hyperSpec's options.
##' 
##' Currently, the following options are defined:
##' \tabular{llll}{
##' \bold{Name} \tab \bold{Default Value (range)} \tab \bold{Description} \                      tab \bold{Used by}\cr
##' debuglevel \ tab 0 (1L 2L) \                   tab amount of debugging information produced \tab \code{\link{spc.identify}} \code{\link{map.identify}}\cr
##' gc \         tab FALSE \                       tab triggers frequent calling of gc () \      tab \code{\link{read.ENVI}}, \code{new ("hyperSpec")}\cr
##' log \        tab FALSE \                       tab automatically create entries \            tab \code{\link{logbook}}\cr
##' }
##' 
##' \code{hy.setOptions} will discard any values that were given without a
##' name.
##' 
##' @rdname options
##' @param \dots \code{hy.setOptions}: pairs of argument names and values.
##'
##' \code{hy.getOptions}: indices (or names) of the options.
##' @return
##' \tabular{ll}{
##' \code{hy.getOptions} \tab returns a list of all options\cr
##' \code{hy.setOptions} \tab invisibly returns a list with the options \cr
##' \code{hy.getOption}  \tab returns the value of the requested option \cr
##' }
##' @author C. Beleites
##' @keywords misc
##' @export
##' @examples
##' 
##' hy.getOptions ()
##' 
hy.getOptions <- function (...){
  dots <- c (...)
  if (length (dots) == 0L)
    .options
  else
  .options [dots]
}

##' @include hyperspec-package.R
.test (hy.getOptions) <- function (){
  checkEquals (hy.getOptions (), .options)

  checkEquals (hy.getOptions (tail (names (.options), 1)),
               tail (.options, 1))
}

##' @rdname options
##' @export
##' @param name the name of the option
hy.getOption <- function (name){
  .options [[name]]
}

##' @rdname options
##' @export
hy.setOptions <- function (...){
  new <- list (...)
  names <- nzchar (names (new))

  if (! all (names))
    warning ("options without name are discarded: ", which (! names))
  
  opts <- modifyList (.options, new [names])
  
  if (sys.parent() == 0) 
    env <- asNamespace ("hyperSpec")
  else
    env <- parent.frame ()

  assign(".options", opts, envir = env)

  invisible (opts)
}

