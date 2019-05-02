context("Check bin choose inputs and outputs")

test_that("bin_choose fails with invalid value", {
  
  expect_error(bin_choose(2, 3))
  expect_error(bin_choose(1, 5))
})

test_that("check bin_choose with correct output", {
  
  expect_equal(bin_choose(n = 5, k = 2), 10)
  expect_equal(bin_choose(3, 2), 3)
  expect_equal(bin_choose(6, 3), 20)
  expect_equal(bin_choose(5, 1:3), c(5, 10, 10))
})

test_that("check bin_choose fails with incorrect output", {
  
  expect_false(bin_choose(3, 2) == 2)
  expect_false(bin_choose(2, 1) == 1)
})