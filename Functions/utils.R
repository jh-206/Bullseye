#*********************************#
#                                 #
#  Utility Functions              #
#                                 #
#*********************************#

# Round to nearest specified digit ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  
  m_round <- function(x,base){ 
    base*round(x/base) 
  } 
  

# Shift Plot Axis to Cartesian --------------------------------------------

  shift_axis <- function(p, y=0){
    g <- ggplotGrob(p)
    dummy <- data.frame(y=y)
    ax <- g[["grobs"]][g$layout$name == "axis-b"][[1]]
    p + annotation_custom(grid::grobTree(ax, vp = grid::viewport(y=1, height=sum(ax$height))),
                          ymax=y, ymin=y) +
      geom_hline(aes(yintercept=y), data = dummy) +
      theme(axis.text.x = element_blank(),
            axis.ticks.x=element_blank())
    
  }
  