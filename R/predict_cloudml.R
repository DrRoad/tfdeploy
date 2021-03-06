#' Predict using a CloudML SavedModel
#'
#' Performs a prediction using a CloudML model.
#'
#' @inheritParams predict_savedmodel
#'
#' @param version The version of the CloudML model.
#'
#' @export
predict_savedmodel.cloudml_prediction <- function(
  instances,
  model,
  version = NULL,
  ...) {
  cloudml::cloudml_predict(instances, name = model, version = version) %>%
    append_predictions_class()
}
