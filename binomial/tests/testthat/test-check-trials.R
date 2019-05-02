context("Check trials arguments")

test_that("check_trials with valid value", {
  
  expect_true(check_trials(4))
  expect_true(check_trials(204))
})

test_that("check_trials fails with invalid value", {
  
  expect_error(check_trials(-2))
  expect_error(check_trials(0.2))
})

test_that("check_trials fails with prob length greater than 1", {
  
  expect_error(check_trials(c(0.1, 0.4)))
  expect_error(check_trials(c(2, 0.4, 3.2)))
})