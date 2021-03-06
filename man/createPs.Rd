% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/PsFunctions.R
\name{createPs}
\alias{createPs}
\title{Create propensity scores}
\usage{
createPs(
  cohortMethodData,
  population = NULL,
  excludeCovariateIds = c(),
  includeCovariateIds = c(),
  maxCohortSizeForFitting = 250000,
  errorOnHighCorrelation = TRUE,
  stopOnError = TRUE,
  prior = createPrior("laplace", exclude = c(0), useCrossValidation = TRUE),
  control = createControl(noiseLevel = "silent", cvType = "auto", seed = 1, tolerance =
    2e-07, cvRepetitions = 10, startingVariance = 0.01)
)
}
\arguments{
\item{cohortMethodData}{An object of type \link{CohortMethodData} as generated using
\code{\link[=getDbCohortMethodData]{getDbCohortMethodData()}}.}

\item{population}{A data frame describing the population. This should at least have a
\code{rowId} column corresponding to the \code{rowId} column in the
\link{CohortMethodData} covariates object and a \code{treatment} column.
If population is not specified, the full population in the
\link{CohortMethodData} will be used.}

\item{excludeCovariateIds}{Exclude these covariates from the propensity model.}

\item{includeCovariateIds}{Include only these covariates in the propensity model.}

\item{maxCohortSizeForFitting}{If the target or comparator cohort are larger than this number, they
will be downsampled before fitting the propensity model. The model
will be used to compute propensity scores for all subjects. The
purpose of the sampling is to gain speed. Setting this number to 0
means no downsampling will be applied.}

\item{errorOnHighCorrelation}{If true, the function will test each covariate for correlation with
the treatment assignment. If any covariate has an unusually high
correlation (either positive or negative), this will throw and
error.}

\item{stopOnError}{If an error occurr, should the function stop? Else, the two cohorts
will be assumed to be perfectly separable.}

\item{prior}{The prior used to fit the model. See
\code{\link[Cyclops:createPrior]{Cyclops::createPrior()}} for details.}

\item{control}{The control object used to control the cross-validation used to
determine the hyperparameters of the prior (if applicable). See
\code{\link[Cyclops:createControl]{Cyclops::createControl()}} for details.}
}
\description{
Creates propensity scores using a regularized logistic regression.
}
\examples{
data(cohortMethodDataSimulationProfile)
cohortMethodData <- simulateCohortMethodData(cohortMethodDataSimulationProfile, n = 1000)
ps <- createPs(cohortMethodData)

}
