## Overview

`binomial` is a package that provides users with functions that can be used to calculate the  probabilities of a Binomial random variable. The package also includes other related functions including the probability distribution, variance, expected value, and more!

- `bin_varialbe()` creates a binomial variable object with two attributes: `trials` and `prob`
- `bin_choose()` calculates the number of combinations in which `k` successes can occur within `n` trials
- `bin_probability()` calculates the probability of a binomial random variable
- `bin_distribution()` returns a dataframe of the probability distribution of a binomial variable
- `bin_cumulative()` returns a dataframe of both the probability distribution and cumulative probability of a binomial varialbe

## Installation

You can install the development version of `binomial` from Github using the R package: `devtools`. Use the following commands in the console of R-Studio to install the package:

``` r
# install "binomial" without vignettes
devtools::install_github("hw-stat133-grant-kalasky/binomial")

# install "binomial" WITH vignettes
devtools::install_github("hw-stat133-grant-kalasky/binomial", build_vignettes = TRUE)
```

## Usage

``` r
# Creating a binvar object
bin1 <- bin_variable(trials = 10, p = 0.3)
bin1
#> "Binomial variable"
#> Paramaters
#> - number of trials: 10
#> - prob of success : 0.3

# Print summary of binomial variable
summary(bin1)
#> "Summary Binomial"
#>  
#> Parameters
#> - number of trials: 10
#> - prob of success: 0.3
#> 
#> Measures
#> - mean: 3
#> - variance: 2.1
#> - mode: 3
#> - skewness: 0.276026223736942
#> - kurtosis: -0.123809523809524

# Binomial Distribution of a binomial variable
bin_distribution(trials = 5, prob = 0.5)
#>   success probability
#> 1       0     0.03125
#> 2       1     0.15625
#> 3       2     0.31250
#> 4       3     0.31250
#> 5       4     0.15625
#> 6       5     0.03125

# Cumulative Probability of a binomial variable
bin_cumulative(trials = 5, prob = 0.5)
#>  success probability cumulative
#> 1       0     0.03125    0.03125
#> 2       1     0.15625    0.18750
#> 3       2     0.31250    0.50000
#> 4       3     0.31250    0.81250
#> 5       4     0.15625    0.96875
#> 6       5     0.03125    1.00000
```
