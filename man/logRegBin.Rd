% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/logregbin.h.R
\name{logRegBin}
\alias{logRegBin}
\title{Binomial Logistic Regression}
\usage{
logRegBin(data, dep, covs = NULL, factors = NULL,
  blocks = list(list()), refLevels = NULL, modelTest = FALSE,
  dev = TRUE, aic = TRUE, bic = FALSE, pseudoR2 = list("r2mf"),
  omni = FALSE, ci = FALSE, ciWidth = 95, OR = FALSE,
  ciOR = FALSE, ciWidthOR = 95, emMeans = list(list()),
  ciEmm = TRUE, ciWidthEmm = 95, emmPlots = TRUE,
  emmTables = FALSE, emmWeights = TRUE, class = FALSE, acc = FALSE,
  spec = FALSE, sens = FALSE, auc = FALSE, rocPlot = FALSE,
  cutOff = 0.5, cutOffPlot = FALSE, collin = FALSE,
  boxTidwell = FALSE, cooks = FALSE)
}
\arguments{
\item{data}{the data as a data frame}

\item{dep}{a string naming the dependent variable from \code{data},
variable must be a factor}

\item{covs}{a vector of strings naming the covariates from \code{data}}

\item{factors}{a vector of strings naming the fixed factors from
\code{data}}

\item{blocks}{a list containing vectors of strings that name the predictors
that are added to the model. The elements are added to the model according
to their order in the list}

\item{refLevels}{a list of lists specifying reference levels of the
dependent variable and all the factors}

\item{modelTest}{\code{TRUE} or \code{FALSE} (default), provide the model
comparison between the models and the NULL model}

\item{dev}{\code{TRUE} (default) or \code{FALSE}, provide the deviance (or
-2LogLikelihood) for the models}

\item{aic}{\code{TRUE} (default) or \code{FALSE}, provide Aikaike's
Information Criterion (AIC) for the models}

\item{bic}{\code{TRUE} or \code{FALSE} (default), provide Bayesian
Information Criterion (BIC) for the models}

\item{pseudoR2}{one or more of \code{'r2mf'}, \code{'r2cs'}, or
\code{'r2n'}; use McFadden's, Cox & Snell, and Nagelkerke pseudo-R²,
respectively}

\item{omni}{\code{TRUE} or \code{FALSE} (default), provide the omnibus
likelihood ratio tests for the predictors}

\item{ci}{\code{TRUE} or \code{FALSE} (default), provide a confidence
interval for the model coefficient estimates}

\item{ciWidth}{a number between 50 and 99.9 (default: 95) specifying the
confidence interval width}

\item{OR}{\code{TRUE} or \code{FALSE} (default), provide the exponential of
the log-odds ratio estimate, or the odds ratio estimate}

\item{ciOR}{\code{TRUE} or \code{FALSE} (default), provide a confidence
interval for the model coefficient odds ratio estimates}

\item{ciWidthOR}{a number between 50 and 99.9 (default: 95) specifying the
confidence interval width}

\item{emMeans}{a list of lists specifying the variables for which the
estimated marginal means need to be calculate. Supports up to three
variables per term.}

\item{ciEmm}{\code{TRUE} (default) or \code{FALSE}, provide a confidence
interval for the estimated marginal means}

\item{ciWidthEmm}{a number between 50 and 99.9 (default: 95) specifying the
confidence interval width for the estimated marginal means}

\item{emmPlots}{\code{TRUE} (default) or \code{FALSE}, provide estimated
marginal means plots}

\item{emmTables}{\code{TRUE} or \code{FALSE} (default), provide estimated
marginal means tables}

\item{emmWeights}{\code{TRUE} (default) or \code{FALSE}, weigh each cell
equally or weigh them according to the cell frequency}

\item{class}{\code{TRUE} or \code{FALSE} (default), provide a predicted
classification table (or confusion matrix)}

\item{acc}{\code{TRUE} or \code{FALSE} (default), provide the predicted
accuracy of outcomes grouped by the cut-off value}

\item{spec}{\code{TRUE} or \code{FALSE} (default), provide the predicted
specificity of outcomes grouped by the cut-off value}

\item{sens}{\code{TRUE} or \code{FALSE} (default), provide the predicted
sensitivity of outcomes grouped by the cut-off value}

\item{auc}{\code{TRUE} or \code{FALSE} (default), provide the rea under the
ROC curve (AUC)}

\item{rocPlot}{\code{TRUE} or \code{FALSE} (default), provide a ROC curve
plot}

\item{cutOff}{\code{TRUE} or \code{FALSE} (default), set a cut-off used for
the predictions}

\item{cutOffPlot}{\code{TRUE} or \code{FALSE} (default), provide a cut-off
plot}

\item{collin}{\code{TRUE} or \code{FALSE} (default), provide VIF and
tolerence collinearity statistics}

\item{boxTidwell}{\code{TRUE} or \code{FALSE} (default), provide
Box-Tidwell test for linearity of the logit}

\item{cooks}{\code{TRUE} or \code{FALSE} (default), provide summary
statistics for the Cook's distance}
}
\value{
A results object containing:
\tabular{llllll}{
  \code{results$modelFit} \tab \tab \tab \tab \tab a table \cr
  \code{results$modelComp} \tab \tab \tab \tab \tab a table \cr
  \code{results$models} \tab \tab \tab \tab \tab an array of model specific results \cr
  \code{results$predictOV} \tab \tab \tab \tab \tab an output \cr
  \code{results$residsOV} \tab \tab \tab \tab \tab an output \cr
  \code{results$cooksOV} \tab \tab \tab \tab \tab an output \cr
}

Tables can be converted to data frames with \code{asDF} or \code{\link{as.data.frame}}. For example:

\code{results$modelFit$asDF}

\code{as.data.frame(results$modelFit)}
}
\description{
Binomial Logistic Regression
}
\examples{
data('birthwt', package='MASS')

dat <- data.frame(
            low = factor(birthwt$low),
            age = birthwt$age,
            bwt = birthwt$bwt)

logRegBin(data = dat, dep = low,
          covs = vars(age, bwt),
          blocks = list(list("age", "bwt")),
          refLevels = list(list(var="low", ref="0")))

#
#  BINOMIAL LOGISTIC REGRESSION
#
#  Model Fit Measures
#  ---------------------------------------
#    Model    Deviance    AIC     R²-McF
#  ---------------------------------------
#        1     4.97e-7    6.00     1.000
#  ---------------------------------------
#
#
#  MODEL SPECIFIC RESULTS
#
#  MODEL 1
#
#  Model Coefficients
#  ------------------------------------------------------------
#    Predictor    Estimate      SE          Z           p
#  ------------------------------------------------------------
#    Intercept    2974.73225    218237.2      0.0136    0.989
#    age            -0.00653       482.7    -1.35e-5    1.000
#    bwt            -1.18532        87.0     -0.0136    0.989
#  ------------------------------------------------------------
#    Note. Estimates represent the log odds of "low = 1"
#    vs. "low = 0"
#
#

}
