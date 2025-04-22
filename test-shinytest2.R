library(shinytest2)

test_that("{shinytest2} recording: 786MIII-Propcont", {
  app <- AppDriver$new(name = "786MIII-Propcont", height = 927, width = 609)
  app$set_inputs(sidebarId = TRUE)
  app$set_inputs(data_table_rows_current = c(1, 2, 3, 4), allow_no_input_binding_ = TRUE)
  app$set_inputs(data_table_rows_all = c(1, 2, 3, 4), allow_no_input_binding_ = TRUE)
  app$set_inputs(data_table_state = c(1745345001860, 0, 5, "", TRUE, FALSE, TRUE, 
      c(TRUE, "", TRUE, FALSE, TRUE), c(TRUE, "", TRUE, FALSE, TRUE), c(TRUE, "", 
          TRUE, FALSE, TRUE), c(TRUE, "", TRUE, FALSE, TRUE), c(TRUE, "", TRUE, FALSE, 
          TRUE), c(TRUE, "", TRUE, FALSE, TRUE), c(TRUE, "", TRUE, FALSE, TRUE), 
      c(TRUE, "", TRUE, FALSE, TRUE)), allow_no_input_binding_ = TRUE)
  app$set_window_size(width = 1619, height = 959)
  app$expect_download("download_sample")
  rlang::warn(paste0("`file` should be the path to the file, relative to the app's tests/testthat directory.\n", 
      "Remove this warning when the file is in the correct location."))
  app$upload_file(file = "sample_meta_data.csv")
  app$set_inputs(data_table_rows_current = c(1, 2, 3, 4), allow_no_input_binding_ = TRUE)
  app$set_inputs(data_table_rows_all = c(1, 2, 3, 4), allow_no_input_binding_ = TRUE)
  app$set_inputs(data_table_state = c(1745345026038, 0, 5, "", TRUE, FALSE, TRUE, 
      c(TRUE, "", TRUE, FALSE, TRUE), c(TRUE, "", TRUE, FALSE, TRUE), c(TRUE, "", 
          TRUE, FALSE, TRUE), c(TRUE, "", TRUE, FALSE, TRUE), c(TRUE, "", TRUE, FALSE, 
          TRUE), c(TRUE, "", TRUE, FALSE, TRUE), c(TRUE, "", TRUE, FALSE, TRUE), 
      c(TRUE, "", TRUE, FALSE, TRUE)), allow_no_input_binding_ = TRUE)
  app$set_inputs(tabs_428724257 = "tab_meta")
  app$set_inputs(tabs_428724257 = "tab_setup")
  app$set_inputs(tabs_428724257 = "tab_forest")
  app$set_inputs(tabs_428724257 = "tab_subgroup")
  app$set_inputs(tabs_428724257 = "tab_diag")
  app$set_inputs(tabs_428724257 = "tab_extra")
  app$set_inputs(tabs_428724257 = "tab_advanced")
  app$expect_download("download_density")
})
