library(tfestimators)

mtcars_input_fn <- function(data, num_epochs = 1) {
  input_fn(data,
           features = c("disp", "cyl"),
           response = "mpg",
           batch_size = 32,
           num_epochs = num_epochs)
}

cols <- feature_columns(column_numeric("disp"), column_numeric("cyl"))

model <- linear_regressor(feature_columns = cols)

indices <- sample(1:nrow(mtcars), size = 0.80 * nrow(mtcars))
train <- mtcars[indices, ]
test  <- mtcars[-indices, ]

model %>% train(mtcars_input_fn(train, num_epochs = 10))

export_savedmodel(model, "tfestimators-mtcars", as_text = TRUE)
