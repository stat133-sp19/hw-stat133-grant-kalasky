context("Check aux kurtosis outputs")

test_that("check aux_kurtosis with correct output", {

  expect_equal(aux_kurtosis(10, 0.3), -0.1238095238, tolerance = .001)
  expect_equal(aux_kurtosis(20, 0.2), 0.0125)

})

test_that("check aux_skewness fails with incorrect output", {

  expect_false(aux_kurtosis(10, 0.25) == 0.6666)
  expect_false(aux_kurtosis(60, 0.3) == -0.0255)
})
