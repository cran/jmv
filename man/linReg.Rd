% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/linreg.h.R
\name{linReg}
\alias{linReg}
\title{Linear Regression}
\usage{
linReg(data, dep, covs = NULL, factors = NULL, weights = NULL,
  blocks = list(list()), refLevels = NULL, intercept = "refLevel",
  r = TRUE, r2 = TRUE, r2Adj = FALSE, aic = FALSE, bic = FALSE,
  rmse = FALSE, modelTest = FALSE, anova = FALSE, ci = FALSE,
  ciWidth = 95, stdEst = FALSE, ciStdEst = FALSE,
  ciWidthStdEst = 95, norm = FALSE, qqPlot = FALSE,
  resPlots = FALSE, durbin = FALSE, collin = FALSE, cooks = FALSE,
  emMeans = list(list()), ciEmm = TRUE, ciWidthEmm = 95,
  emmPlots = TRUE, emmTables = FALSE, emmWeights = TRUE)
}
\arguments{
\item{data}{the data as a data frame}

\item{dep}{the dependent variable from \code{data}, variable must be
numeric}

\item{covs}{the covariates from \code{data}}

\item{factors}{the fixed factors from \code{data}}

\item{weights}{the (optional) weights from \code{data} to be used in the
fitting process}

\item{blocks}{a list containing vectors of strings that name the predictors
that are added to the model. The elements are added to the model according
to their order in the list}

\item{refLevels}{a list of lists specifying reference levels of the
dependent variable and all the factors}

\item{intercept}{\code{'refLevel'} (default) or \code{'grandMean'}, coding
of the intercept. Either creates contrast so that the intercept represents
the reference level or the grand mean}

\item{r}{\code{TRUE} (default) or \code{FALSE}, provide the statistical
measure \code{R} for the models}

\item{r2}{\code{TRUE} (default) or \code{FALSE}, provide the statistical
measure \code{R-squared} for the models}

\item{r2Adj}{\code{TRUE} or \code{FALSE} (default), provide the statistical
measure \code{adjusted R-squared} for the models}

\item{aic}{\code{TRUE} or \code{FALSE} (default), provide Aikaike's
Information Criterion (AIC) for the models}

\item{bic}{\code{TRUE} or \code{FALSE} (default), provide Bayesian
Information Criterion (BIC) for the models}

\item{rmse}{\code{TRUE} or \code{FALSE} (default), provide RMSE for the
models}

\item{modelTest}{\code{TRUE} (default) or \code{FALSE}, provide the model
comparison between the models and the NULL model}

\item{anova}{\code{TRUE} or \code{FALSE} (default), provide the omnibus
ANOVA test for the predictors}

\item{ci}{\code{TRUE} or \code{FALSE} (default), provide a confidence
interval for the model coefficients}

\item{ciWidth}{a number between 50 and 99.9 (default: 95) specifying the
confidence interval width}

\item{stdEst}{\code{TRUE} or \code{FALSE} (default), provide a standardized
estimate for the model coefficients}

\item{ciStdEst}{\code{TRUE} or \code{FALSE} (default), provide a confidence
interval for the model coefficient standardized estimates}

\item{ciWidthStdEst}{a number between 50 and 99.9 (default: 95) specifying
the confidence interval width}

\item{norm}{\code{TRUE} or \code{FALSE} (default), perform a Shapiro-Wilk
test on the residuals}

\item{qqPlot}{\code{TRUE} or \code{FALSE} (default), provide a Q-Q plot of
residuals}

\item{resPlots}{\code{TRUE} or \code{FALSE} (default), provide residual
plots where the dependent variable and each covariate is plotted against
the standardized residuals.}

\item{durbin}{\code{TRUE} or \code{FALSE} (default), provide results of the
Durbin- Watson test for autocorrelation}

\item{collin}{\code{TRUE} or \code{FALSE} (default), provide VIF and
tolerence collinearity statistics}

\item{cooks}{\code{TRUE} or \code{FALSE} (default), provide summary
statistics for the Cook's distance}

\item{emMeans}{a formula containing the terms to estimate marginal means
for, supports up to three variables per term}

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
Linear regression is used to explore the relationship between a continuous 
dependent variable, and one or more continuous and/or categorical 
explanatory variables. Other statistical methods, such as ANOVA and ANCOVA, 
are in reality just forms of linear regression.
}
\examples{
data('Prestige', package='carData')

linReg(data = Prestige, dep = income,
       covs = vars(education, prestige, women),
       blocks = list(list('education', 'prestige', 'women')))

#
#  LINEAR REGRESSION
#
#  Model Fit Measures
#  ---------------------------
#    Model    R        R²
#  ---------------------------
#        1    0.802    0.643
#  ---------------------------
#
#
#  MODEL SPECIFIC RESULTS
#
#  MODEL 1
#
#
#  Model Coefficients
#  --------------------------------------------------------
#    Predictor    Estimate    SE         t         p
#  --------------------------------------------------------
#    Intercept      -253.8    1086.16    -0.234     0.816
#    women           -50.9       8.56    -5.948    < .001
#    prestige        141.4      29.91     4.729    < .001
#    education       177.2     187.63     0.944     0.347
#  --------------------------------------------------------
#

}
