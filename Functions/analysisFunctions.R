#*********************************#
#                                 #
#  Bullseye Analysis Functions    #
#                                 #
#*********************************#

# Basic Summary Stats ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  summary_table <- function(b) {
    require(dplyr)
    
    summary.table <- b %>%
      dplyr::summarise("N" = scales::comma(n()),
                       "Mean" = round(mean(lag), 2),
                       "Median" = round(median(lag), 2),
                       "SD" = round(sd(lag), 2))
    return(summary.table)
  }
  

# ggplot Wrappers ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  hist_wrap <- function(vec, main = "Histogram of Bullseye Lags", ...) {
    require(ggplot2)
    
    h <- qplot(vec,
          main = main,
          geom = "histogram",
          binwidth = 5,
          breaks = seq(0, m_round(max(vec), 5), by = 5),
          fill = I("gray"),
          col = I("black"),
          xlab = "Lag", 
          ...)
    return(h)
  }

  ts_plot_wrap <- function(vec) {
    
    ts.obj <- data.frame(Bullseye = 0:length(vec), Lag = c(0, vec))
    
    ts.plt <- ggplot(ts.obj, aes(x = Bullseye, y = Lag))  + 
      theme_bw()
    
    ts.plt <- ts.plt + geom_point(size = .8) + geom_line()
    
    # shift_axis(ts.plt, 0)
    return(ts.plt)
  }
  
  
  