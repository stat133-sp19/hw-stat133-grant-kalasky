#' @title Barplot of object bindis
#' @description Plots the relative probabilities of a series of successes
#' @param dist_df dataframe of binomial distribution of number of successes
#' @return barplot of binomial distribution
#' @export
plot.bindis <- function(dist_df) {
  return(barplot(dist_df$probability,
                 xlab = "successes",
                 ylab = "proability",
                 names.arg = dist_df$success)
  )
}
