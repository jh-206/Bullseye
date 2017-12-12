#*********************************#
#                                 #
#  Test S3 Class Functions        #
#                                 #
#*********************************#



# analysisObj <- function(df, cl = NULL) {
#   
#   if(!is.null(cl)){class(df) <- cl}
#   
#   return(df)
# }

# Custom plot functions ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

plt <- function(aObj) {
  UseMethod("plt")
}

plt.default <- function(aObj) {
  hist_wrap(aObj)
}

plt.ts <- function(aObj) {
  ts_plot_wrap(aObj)
}


# Custom summary functions ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

summary_table(bulls)
summary(bulls$lag)

