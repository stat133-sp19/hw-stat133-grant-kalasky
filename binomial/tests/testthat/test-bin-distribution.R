context("Check bin distribution inputs and outputs")

test_that("check bin_distribution with correct output type", {
  
  expect_s3_class(bin_distribution(trials = 5, prob = 0.5), "data.frame")
  expect_s3_class(bin_distribution(trials = 5, prob = 0.5), "data.frame")

})

test_that("check bin_distribution with correct output", {
  
  expect_equivalent(bin_distribution(trials = 5, prob = 0.5), 
               data.frame(success=c(0, 1, 2, 3, 4, 5),
                          probability=c(0.03125, 0.15625, 0.31250, 0.31250, 0.15625, 0.03125)))
  expect_equivalent(bin_distribution(4, 0.2), 
                    data.frame(success=c(0, 1, 2, 3, 4), 
                               probability=c(0.4096,  0.4096, 0.1536, 0.0256, 0.0016)))
  
})