context("Check bin cumulative inputs and outputs")

test_that("check bin_cumulative with correct output type", {
  
  expect_s3_class(bin_cumulative(trials = 5, prob = 0.5), "data.frame")
  expect_s3_class(bin_cumulative(trials = 10, prob = 0.3), "data.frame")
  
})

test_that("check bin_cumulative with correct output", {
  
  expect_equivalent(bin_cumulative(trials = 5, prob = 0.5), 
                    data.frame(success=c(0, 1, 2, 3, 4, 5),
                               probability=c(0.03125, 0.15625, 0.31250, 0.31250, 0.15625, 0.03125), 
                               cumulative=c(0.03125, 0.18750, 0.50000, 0.8125, 0.96875, 1.00000)))
  
})