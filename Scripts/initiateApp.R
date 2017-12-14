#*********************************#
#                                 #
#  Initiate App Script            #
#                                 #
#*********************************#


# Environment -------------------------------------------------------------

  lapply(c("dplyr", "ggplot2", "feather"), library, character.only = TRUE)

  # Source user packages  
  sapply(file.path(file.path(getwd(), "Functions"), c("analysisFunctions.R", "utils.R")), source)


# Paths -------------------------------------------------------------------

  data.path <- "C:/Users/jhirschi/Documents/Data/Bullseye"


# Set Conditions ----------------------------------------------------------

  # Define the fields we want to save from the input
  fields <- c("lag_input", "red_bull_input")
