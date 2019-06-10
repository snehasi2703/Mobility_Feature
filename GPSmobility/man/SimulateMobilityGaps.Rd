\name{SimulateMobilityGaps}
\alias{SimulateMobilityGaps}

\title{
Replaces the missing intervals in a mobility matrix with simulated trajectories.
}
\description{
The missing intervals of a mobility matrix are replaced with simulated trajectories based on resampling from observed data.
}
\usage{
SimulateMobilityGaps(suboutmat, obj, wtype = "TL", spread_pars = c(1, 1))
}

\arguments{
  \item{suboutmat}{
  Mobility matrix as created by the MobilityFeatures() function.
}
  \item{obj}{
  Object containing resampling information from the full data. This is also created by the MobilityFeatures() function.
}
  \item{wtype}{
	Weighting kernel used in resampling. "TL" for temporally local weighting, "GL" for geographically local weighting, and "GLC" for geographically local circadian routine weighting.
}
  \item{spread_pars}{
	Parameters for the spread of the kernel. Input as a vector of length 2, the first entry is the degrees of freedom of the t-distribution and the second entry is the scaling parameter (large scaling values give larger weight to the closer observations).
}
}
\details{
The mobility matrix (suboutmat) and obj must be preloaded by calling the MobilityFeatures() function first.
}
\value{
Mobility matrix.
}
\references{
}
\author{
Ian Barnett
}
\note{
}


\seealso{
}
\examples{
}
\keyword{ manip }
