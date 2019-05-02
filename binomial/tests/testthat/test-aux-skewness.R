context("Check aux skewness outputs")

test_that("check aux_skewness with correct output", {
  
  expect_equal(aux_skewness(10, 0.3),  0.2760262237)
  expect_equal(aux_skewness(24, 0.4), 0.08333333333, tolerance = .001)
  expect_equal(aux_skewness(40, 0.32), 0.1220233825)
})

test_that("check aux_skewness fails with incorrect output", {
  
  expect_false(aux_skewness(10, 0.3) == 0.243)
  expect_false(aux_skewness(20, 0.28) == 0.342)
})