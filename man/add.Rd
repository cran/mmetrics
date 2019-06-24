% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mmetrics.R
\name{add}
\alias{add}
\title{Add metrics to data.frame}
\usage{
add(df, ..., metrics = ad_metrics, summarize = FALSE)
}
\arguments{
\item{df}{data.frame}

\item{...}{group keys}

\item{metrics}{metrics}

\item{summarize}{summarize all data or not (mutate compatible behavior) when group keys (thee dots) are empty}
}
\value{
data.frame with calculated metrics
}
\description{
Add metrics to data.frame
}
\examples{
# Dummy data
df <- data.frame(
  gender = rep(c("M", "F"), 5),
  age = (1:10)*10,
  cost = c(51:60),
  impression = c(101:110),
  click = c(0:9)*3
)

metrics <- mmetrics::define(
  cost = sum(cost),
  ctr  = sum(click)/sum(impression)
)

# Evaluate
mmetrics::add(df, gender, metrics = metrics)

}