context("temp_load")

test_that("temp_load fails well", {
  expect_error(nadp_load("gibberish", "other"),
  paste0("Dataset not found at: ",
  paste0(cache_path(), "1/dep_other_gibberish", ".tif"),
  "\n Try running the appropriate `get*` and/or `compile` commands."),
  fixed = TRUE)}
)
