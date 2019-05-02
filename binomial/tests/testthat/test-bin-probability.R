context("Check bin probability inputs and outputs")

test_that("bin_probability fails with invalid value", {
  
  expect_error(bin_probability(2, -2, 0.5))
  expect_error(bin_probability(3, 2, 0.2))
  expect_error(bin_probability(2, 5, -0.2))
})

test_that("check bin_choose with correct output", {
  
  expect_equal(bin_probability(success = 2, trials = 5, prob = 0.5), 0.3125)
  expect_equal(bin_probability(success = 0:2, trials = 5, prob = 0.5), c(0.03125, 0.15625, 0.31250))
  expect_equal(bin_probability(success = 55, trials = 100, prob = 0.45),  0.01075277)

})