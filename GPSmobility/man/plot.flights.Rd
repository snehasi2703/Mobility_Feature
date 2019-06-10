\name{plot.flights}
\alias{plot.flights}

\title{
Plotting function for a mobility matrix as produced by the MobilityFeatures().
}
\description{
Specialized plotting function for a mobility matrix as produced by the MobilityFeatures() as part of the GPSmobility package.
}
\usage{
plot.flights(mat, xrang = NULL, yrang = NULL, diminch = 6, add2plot = FALSE, addlegend = TRUE, outfile = NULL, title = NULL)
}

\arguments{
  \item{mat}{
  Mobility matrix.
}
  \item{xrang}{
  Vector of length 2. A range for the x values. Defaults to the x range of the input mobility matrix, mat.
}
  \item{yrang}{
  Vector of length 2. A range for the y values. Defaults to the y range of the input mobility matrix, mat.
}
  \item{diminch}{
  Numeric. Dimension of the square plotting area in inches.
}
  \item{add2plot}{
  Boolean. FALSE is the default, and a new plot will be generated. TRUE will overlay the existing plot.
}
  \item{addlegend}{
  Boolean. TRUE will include the legend (distance and time of day), while FALSE will not include it.
}
  \item{outfile}{
  String. The filename (a pdf) to write the plot to.
}
  \item{title}{
  String. The title of the plot (equivalent to "main" in standard plotting).
}
}
\details{
}
\value{
Same value output as the standard plot() function.
}
\references{
}
\author{
Ian Barnett
}
\note{
}

\seealso{
\code{\link{plotlimits}}
}
\examples{
}
\keyword{ aplot }
