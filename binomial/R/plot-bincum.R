#' @title Barplot of object bindis
#' @description Plots cumulative distribution of binomial distribution
#' @param bin_df dataframe of probability and cumulative ditributions
#' @return barplot of binomial distribution
#' @export
plot.bincum <- function(bin_df) {
  return(plot(x = bin_df$success,
              y = bin_df$cumulative,
              xlab = "successes",
              ylab = "proability",
              type = "b")
  )
}
