\name{olmm-overwritePar}

\alias{olmm-overwritePar}
\alias{olmm_overwritePar}

\title{Overwrite coefficients of \command{\link{olmm}} objects.}

\description{
  Overwrite coefficients of an \command{\link{olmm}} object and update the
  likelihood and estimates for random effects.
}

\usage{

olmm_overwritePar(object, coefficients)
}

\arguments{
 \item{object}{an \command{\link{olmm}} object.}
 \item{coefficients}{numeric vector of model coefficients. Must have the
 same length as \code{object$coefficients} and, if provided, the same
 element names.}
}

\details{
  May be used for simulation studies where parameters are user defined.
}

\value{
  An \command{\link{olmm}} object.
}

\author{Reto Burgin}

\seealso{\command{\link{olmm}}}

\examples{
data(schizo)

model.10.3.1 <-
  olmm(imps79o ~ tx + sqrt(week) + re(1|id),
       data = schizo, family = cumulative())
summary(model.10.3.1)

(newCoef <- coef(model.10.3.1))
newCoef[1:3] <- c(-7, -4, -2) # thresholds
newCoef["tx"] <- 1.5
newCoef["sqrt(week)"] <- 1.6
newCoef[6] <- 2

model.10.3.1.mod <- olmm_overwritePar(object = model.10.3.1, coefficients = newCoef)
summary(model.10.3.1.mod)

}
