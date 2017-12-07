#*********************************#
#                                 #
#  Bullseye Analysis Functions    #
#                                 #
#*********************************#

# Basic Summary Stats ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  summary_table <- function(b) {
    require(dplyr)
    
    summary_table <- bulls %>%
      dplyr::summarise("N" = scales::comma(n()),
                       "Mean Lag" = round(mean(lag), 2),
                       "Median Lag" = round(median(lag), 2))
    return(summary_table)
  }
  

# ggplot Histogram Wrapper ------------------------------------------------

  hist_wrap <- function(b, ...) {
    require(ggplot2)
    
    h <- qplot(b$lag,
          main = "Histogram of Bullseye Lags",
          geom = "histogram",
          binwidth = 2,
          fill = I("gray"),
          col = I("black"),
          xlab = "Lag", 
          ...)
    return(h)
  }



  
  