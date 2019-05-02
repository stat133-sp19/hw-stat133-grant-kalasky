context("Check aux mean outputs")

test_that("check aux_mean with correct output", {
  
  expect_equal(aux_mean(10, 0.3), 3)
  expect_equal(aux_mean(2, 0.2), 0.4)
  expect_equal(aux_mean(30, 0.45), 13.5)
  expect_equal(aux_mean(23, 0.24), 5.52)
})

test_that("check aux_mean fails with incorrect output", {
  
  expect_false(aux_mean(10, 0.3) == 2)
  expect_false(aux_mean(20, 0.5) == 12)
  expect_false(aux_mean(4, 0.5) == 1)
  expect_false(aux_mean(9, 0.5) == 3)
})