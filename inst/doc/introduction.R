## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
# Dummy data
df <- data.frame(
  gender = rep(c("M", "F"), 5),
  age = (1:10)*10,
  cost = c(51:60),
  impression = c(101:110),
  click = c(0:9)*3,
  conversion = c(0:9)
)

head(df)

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
mmetrics::add(df, metrics = metrics, summarize = FALSE)

## ------------------------------------------------------------------------
mmetrics::disaggregate(metrics)

