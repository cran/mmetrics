## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
# Load dummy data
df <- mmetrics::dummy_data
df

## ------------------------------------------------------------------------
# Example metrics
metrics <- mmetrics::define(
  cost = sum(cost),
  ctr  = sum(click)/sum(impression)
)

## ------------------------------------------------------------------------
mmetrics::add(df, gender, metrics = metrics)

## ------------------------------------------------------------------------
mmetrics::add(df, gender, age, metrics = metrics)

## ------------------------------------------------------------------------
mmetrics::add(df, metrics = metrics)

## ------------------------------------------------------------------------
mmetrics::add(df, metrics = mmetrics::disaggregate(metrics), summarize = FALSE)

## ------------------------------------------------------------------------
# Original metrics. sum() is used for this metrics
metrics

## ------------------------------------------------------------------------
# Disaggregate metrics!
metrics_disaggregated <- mmetrics::disaggregate(metrics)
# Woo! sum() are removed!!!
metrics_disaggregated

## ------------------------------------------------------------------------
dplyr::mutate(df, !!!metrics_disaggregated)

## ------------------------------------------------------------------------
mmetrics::gmutate(df, metrics = metrics_disaggregated)

## ------------------------------------------------------------------------
# Completely the same result with mmetrics::add(df, gender, metrics = metrics)
mmetrics::gsummarize(df, gender, metrics = metrics)

## ------------------------------------------------------------------------
# Cost ratio in each gender group
mmetrics::gmutate(df, gender, metrics = mmetrics::define(cost_ratio = cost/sum(cost)))

## ------------------------------------------------------------------------
# Define keys
keys <- c("gender", "age")
# Run
purrr::map(keys, ~ mmetrics::add(df, !!rlang::sym(.x), metrics = metrics))

