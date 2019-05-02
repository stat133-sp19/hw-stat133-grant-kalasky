

#############################
# Private Checker Functions #
#############################

# private function to test if prob is a valid probability value
check_prob <- function(prob) {
  if (length(prob) > 1) {
    stop("'prob' must be of length 1")
  }

  if (prob < 0 | prob > 1) {
    stop("'prob' values must be between 0 and 1")
  }
  TRUE
}

# private function to test if trials is valid value
check_trials <- function(trials) {
  if (length(trials) > 1) {
    stop("'trials' must be of length 1")
  }

  if (trials %% 1 != 0) {
    stop("invalid 'trials' value")
  }

  if(trials < 0) {
    stop("invalid 'trials' value")
  }
  TRUE
}

# private function to test if success is a valid value
check_success <- function(success, trials) {
  check_trials(trials)

  for (i in 1:length(success)) {
    if (success[i] < 0 | success[i] > trials) {
      stop("invalid 'success' value")
    }
  }
  TRUE
}

###############################
# Private Auxiliary Functions #
###############################

# private function to calculate binomial mean
aux_mean <- function(trials, prob) {
  return(trials * prob)
}

# private function to calculate binomial variance
aux_variance <- function(trials, prob) {
  return((trials * prob) * (1 - prob))
}

# private function to calculate binomial mode
aux_mode <- function(trials, prob) {
  return(floor((trials * prob) + prob))
}

# private function to calculate binomial skewness
aux_skewness <- function(trials, prob) {
  numerator <- 1 - (2 * prob)
  denom <- sqrt((trials * prob) * (1 - prob))
  return(numerator / denom)
}

# private function to calculate binomial kurtosis
aux_kurtosis <- function(trials, prob) {
  numerator <- 1 - ((6 * prob) * (1 - prob))
  denom <- (trials * prob) * (1 - prob)
  return(numerator / denom)
}


##################
# Main Functions #
##################

#' @title N Choose K
#' @description calculates n choose k
#' @param n number of trials
#' @param k number of successes that can occur (can be integer or vector)
#' @return  number of combinations in which k successes can occur in n trials
#' #' @export
#' #' @examples
#'
#' bin_choose(n = 5, k = 2)
#' 10
#'
#' bin_choose(3, 2)
#' 3
#'
#' bin_choose(6, 3)
#' 20
#'
bin_choose <- function(n, k) {
  if (any(k > n)) {
    stop("\n'k' cannot be greater than 'n'")
  }
  if (length(k) == 1) {
    numerator <- factorial(n)
    denom <- factorial(k) * factorial(n - k)
    return(numerator / denom)
  } else {
    numerator <- rep(factorial(n), length(k))
    denom1 <- factorial(k)
    denom2 <- factorial(rep(n, length(k)) - k)
    denom <- denom1 * denom2
    return(numerator / denom)
  }
}

#' @title Binomial Proability
#' @description Calculates probability of success given trials
#' @param success number of successes (can be integer or vector)
#' @param trials number of trials
#' @param prob probability of success
#' @return  probability of success given a number of trials and given probability of success
#' #' @export
#' #' @examples
#'
#' bin_probability(success = 2, trials = 5, prob = 0.5)
#' 0.3125
#'
#' bin_probability(success = 0:2, trials = 5, prob = 0.5)
#' 0.03125 0.15625 0.31250
#'
bin_probability <- function(success, trials, prob) {
  if (!check_success(success, trials)) {
    stop("\ninvalid 'success' values")
  }
  if (!check_trials(trials)) {
    stop("\ninvalid 'trial' value")
  }
  if (!check_prob(prob)) {
    stop("\ninvalid 'prob' value")
  }
  return(bin_choose(trials, success) * prob^(success) * (1 - prob)^(trials - success))
}

#' @title Binomial Distribution
#' @description probability distribution of successes and corresponding probability
#' @param trials number of trials
#' @param prob probability of success
#' @return  dataframe with probability distribution
#' #' @export
#' #' @examples
#'
#' bin_distribution(trials = 5, prob = 0.5)
#' ## success probability
    ## 1 0 0.03125
    ## 2 1 0.15625
    ## 3 2 0.31250
    ## 4 3 0.31250
    ## 5 4 0.15625
    ## 6 5 0.03125
#'
bin_distribution <- function(trials, prob) {
  temp_success <- seq(0, trials, 1)
  bin_probs <- bin_probability(temp_success, trials, prob)
  dist_df <- data.frame(
    success=temp_success,
    probability=bin_probs
  )

  class(dist_df) <- c("bindis", "data.frame")

  return(dist_df)
}


#' @title Binomial Cumulative
#' @description Create dataframe of probability distribution and cumulative probability
#' @param trials number of trials
#' @param prob probability of success
#' @return  dataframe with probability distribution and cumulative probability
#' #' @export
#' #' @examples
#'
#' bin_cumulative(trials = 5, prob = 0.5)
#' ## success probability cumulative
  ## 1 0 0.03125 0.03125
  ## 2 1 0.15625 0.18750
  ## 3 2 0.31250 0.50000
#'
bin_cumulative <- function(trials, prob) {
  temp_success <- seq(0, trials, 1)
  bin_probs <- bin_probability(temp_success, trials, prob)
  bin_df <- data.frame(
    success=temp_success,
    probability=bin_probs,
    cumulative=cumsum(bin_probs)
  )

  class(bin_df) <- c("bincum", "data.frame")

  return(bin_df)
}


#' @title Binomial Variable
#' @description Create binomial variable object
#' @param trials number of trials
#' @param prob probability of success
#' @return  binomial variable with attributes trials and probability of success
#' #' @export
#' #' @examples
#'
#' bin_var1 <- bin_variable(5, 0.2)
#'

bin_variable <- function(trials, prob) {
  if (!check_trials(trials)) {
    stop("invalid 'trial' value")
  }
  if (!check_prob(prob)) {
    stop("invalid 'prob' value")
  }
  bin_var <- list(
    trials=trials,
    prob=prob
  )
  class(bin_var) <- "binvar"

  return(bin_var)
}

#' @export
print.binvar <- function(bin_var) {
  print("Binomial Variable")
  print("", quote = FALSE)
  print('Parameters', quote=FALSE)
  print(paste0("- number of trials: ", bin_var$trials), quote = FALSE)
  print(paste0("- prob of success: ", bin_var$prob), quote = FALSE)
}

#' @export
summary.binvar <- function(bin_var) {
  print("Summary Binomial")
  print("", quote=FALSE)
  print("Parameters", quote = FALSE)
  print(paste0("- number of trials: ", bin_var$trials), quote = FALSE)
  print(paste0("- prob of success: ", bin_var$prob), quote = FALSE)
  print("", quote=FALSE)
  print("Measures", quote = FALSE)
  print(paste0("- mean: ", aux_mean(bin_var$trials, bin_var$prob)), quote = FALSE)
  print(paste0("- variance: ", aux_variance(bin_var$trials, bin_var$prob)), quote = FALSE)
  print(paste0("- mode: ", aux_mode(bin_var$trials, bin_var$prob)), quote = FALSE)
  print(paste0("- skewness: ", aux_skewness(bin_var$trials, bin_var$prob)), quote = FALSE)
  print(paste0("- kurtosis: ", aux_kurtosis(bin_var$trials, bin_var$prob)), quote = FALSE)
}


#' @title Binomial Mean
#' @description calculate binomial mean given trials and probability of success
#' @param trials number of trials
#' @param prob probability of success
#' @return  binomial mean
#' #' @export
bin_mean <- function(trials, prob) {
  return(aux_mean(trials, prob))
}

#' @title Binomial Variance
#' @description calculate binomial variance given trials and probability of success
#' @param trials number of trials
#' @param prob probability of success
#' @return  binomial variance
#' #' @export
bin_variance <- function(trials, prob) {
  return(aux_variance(trials, prob))
}

#' @title Binomial Mode
#' @description calculate binomial mode given trials and probability of success
#' @param trials number of trials
#' @param prob probability of success
#' @return  binomial mode
#' #' @export
bin_mode <- function(trials, prob) {
  return(aux_mode(trials, prob))
}

#' @title Binomial Skewness
#' @description calculate binomial skewness given trials and probability of success
#' @param trials number of trials
#' @param prob probability of success
#' @return  binomial skewness
#' #' @export
bin_skewness <- function(trials, prob) {
  return(aux_skewness(trials, prob))
}

#' @title Binomial Kurtosis
#' @description calculate binomial kurtosis given trials and probability of success
#' @param trials number of trials
#' @param prob probability of success
#' @return  binomial kurtosis
#' #' @export
bin_kurtosis <- function(trials, prob) {
  return(aux_kurtosis(trials, prob))
}

