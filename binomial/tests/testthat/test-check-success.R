context("Check success arguments")

test_that("check_success with valid value", {
  
  expect_true(check_success(2, 4))
  expect_true(check_success(0:4, 7))
  expect_true(check_success(0:3, 5))
})

test_that("check_success fails with invalid values", {
  
  expect_error(check_success(3, 2))
  expect_error(check_success(2:4, 3))
  expect_error(check_success(-2, 3))
})

test_that("check_trials fails with invalid trials value", {
  
  expect_error(check_trials(0:2, -3))
  expect_error(check_trials(2, 5.2))
  expect_error(check_trials(2, c(4, 2)))
})