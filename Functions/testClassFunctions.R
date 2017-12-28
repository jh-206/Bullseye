#*********************************#
#                                 #
#  Test S3 Class Functions        #
#                                 #
#*********************************#
  

# Custom plot functions ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  plt <- function(a_ob, ...) UseMethod("plt")
  
  plt.default <- function(a_obj, ...) {
    hist_wrap(a_obj)
  }
  
  plt.ts <- function(a_obj, ...) {
    ts_plot_wrap(a_obj, ...)
  }


# Custom summary functions ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  summary_table(bulls)
  summary(bulls$lag)

