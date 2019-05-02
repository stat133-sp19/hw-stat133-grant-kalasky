context("Check prob arguments")

test_that("check_prob with valid value", {
  
  expect_true(check_prob(0.2))
  expect_true(check_prob(0.434))
})

test_that("check_prob fails with invalid value", {
  
  expect_error(check_prob(-2))
  expect_error(check_prob(3.2))
})

test_that("check_prob fails with prob length greater than 1", {
  
  expect_error(check_prob(c(0.1, 0.4)))
  expect_error(check_prob(c(2, 0.4, 3.2)))
})