#*********************************#
#                                 #
#  Test S3 Class Functions        #
#                                 #
#*********************************#

analysisObj <- function(df, cl = NULL) {
  
  if(!is.null(cl)){class(df) <- cl}
  
  return(df)
}

plt <- function(aObj) {
  UseMethod("plt", aObj)
}

plt.default <- function(aObj) {
  hist_wrap(aObj$lag)
}

plt.tseries <- function(aObj) {
  ts_plot_wrap(aObj$lag)
}