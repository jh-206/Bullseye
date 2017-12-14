#*********************************#
#                                 #
#  Test S3 Class Functions        #
#                                 #
#*********************************#



  # analysisObj <- function(df, cl = "data.frame") {
  # 
  #   if(cl == "ts"){
  #     a_obj = ts(df)
  #   } else {
  #       a_obj <- structure(
  #         list(df = df),
  #         class = cl
  #       )
  #   } 
  # 
  #   return(a_obj)
  # }

# Custom plot functions ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  plt <- function(a_obj) {
    UseMethod("plt")
  }
  
  plt.default <- function(a_obj) {
    hist_wrap(a_obj)
  }
  
  plt.ts <- function(a_obj) {
    ts_plot_wrap(a_obj)
  }


# Custom summary functions ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  summary_table(bulls)
  summary(bulls$lag)

