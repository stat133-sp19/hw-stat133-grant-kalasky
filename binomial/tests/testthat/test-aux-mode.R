context("Check aux mode outputs")

test_that("check aux_mode with correct output", {
  
  expect_equal(aux_mode(10, 0.3), 3)
  expect_equal(aux_mode(20, 0.2), 4)
  expect_equal(aux_mode(40, 0.48), 19)
  expect_equal(aux_mode(28, 0.35), 10)
})

test_that("check aux_mean fails with incorrect output", {
  
  expect_false(aux_mode(10, 0.3) == 4)
  expect_false(aux_mode(50, 0.6) == 29)
})

test_that("check aux_mean fails with incorrect output in decimals", {
  
  expect_false(aux_mode(10, 0.3) == 3.3)
  expect_false(aux_mode(20, 0.2) == 4.2)
})