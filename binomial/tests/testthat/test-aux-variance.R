context("Check aux variance outputs")

test_that("check aux_variance with correct output", {
  
  expect_equal(aux_variance(10, 0.3), 2.1)
  expect_equal(aux_variance(5, 0.2), 0.8)
  expect_equal(aux_variance(20, 0.48), 4.992)
  expect_equal(aux_variance(10, 0.8), 1.6)
})

test_that("check aux_mean fails with incorrect output", {
  
  expect_false(aux_variance(10, 0.3) == 3)
  expect_false(aux_variance(5, 0.2) == 2)
  expect_false(aux_variance(10, 0.8) == 4)
})