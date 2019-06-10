\name{GPSmobility-package}
\alias{GPSmobility-package}
\alias{GPSmobility}
\docType{package}
\title{
Plots a GPS mobility trace and extracts meaningful mobility measures.
}
\description{
Given raw GPS data, stored as .csv files in the specified directory, this data is denoised and converted into a sequence of flights, pauses, and missing intervals. The meaningful mobility measures are calculated on a daily basis. 
}
\details{
\tabular{ll}{
Package: \tab GPSmobility\cr
Type: \tab Package\cr
Version: \tab 1.5\cr
Date: \tab 2016-09-23\cr
License: \tab GPL-2\cr
}
The MobilityFeatures() function in this package performs the heavy lifting. See that function for details on converting a GPS trace into mobility measures/plotting a GPS mobility trace.
}
\author{
Ian Barnett
Maintainer: Ian Barnett <ianjamesbarnett@gmail.com>
}
\references{
See: Barnett and Onnela. "Inferring Mobility Measures from GPS Traces with Missing Data" (2016).
}
\keyword{ package }
\seealso{
\code{\link{MobilityFeatures}}
\code{\link{plot.flights}}
}
\examples{
}
