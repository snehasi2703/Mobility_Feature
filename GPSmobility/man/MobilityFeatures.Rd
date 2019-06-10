\name{MobilityFeatures}
\alias{MobilityFeatures}

\title{
Plots a GPS mobility trace and extracts meaningful mobility measures.
}
\description{
Given raw GPS data, stored as .csv files in the specified directory, this data is denoised and converted into a sequence of flights, pauses, and missing intervals. The meaningful mobility measures are calculated on a daily basis. 
}
\usage{
MobilityFeatures(filename, fildir, ACCURACY_LIM = 51, ITRVL = 10, nreps = 1, tz = "", CENTERRAD = 200, wtype = "GLR", spread_pars = c(10, 1), minpausedur = 300, minpausedist = 60, rad_fp = NULL, wid_fp = NULL)
}

\arguments{
  \item{filename}{
String. The filename to be assigned to your data. If the MobilityFeatures() function has already been called on this data with the same filename in the same directory, then the cleaned data is simply reloaded. This is to avoid unnecessary recalculation.
  }
  \item{fildir}{
String. The directory containing the GPS data OR the saved output files from a previous execution of the MobilityFeatures() function under the same filename.
  }
  \item{ACCURACY_LIM}{
Numeric. Any GPS ping with accuracy (meters) worse that ACCURACY_LIM is ignored. 
  }
  \item{ITRVL}{
Numeric. GPS data is near continuous, and pings are averaged over intervals of length ITRVL seconds in order to denoise the data.
  }
  \item{nreps}{
Numeric. The number of times the missing intervals are simulated. This is because the simulation is stochastic, so the output mobility measures vary with each simulation.
}
  \item{tz}{
String. The time zone of where the GPS data is from. Defaults to your computer's time zone.
}
  \item{CENTERRAD}{
Numeric. Meters radius from significant locations considered to be at that location.
  }
  \item{wtype}{
String. Weighting kernel used in resampling. "TL" for temporally local weighting, "GL" for geographically local weighting, and "GLR" for geographically local circadian routine weighting.
}
  \item{spread_pars}{
Numeric array. Parameters for the spread of the kernel. Input as a vector of length 2, the first entry is the degrees of freedom of the t-distribution and the second entry is the scaling parameter (large scaling values give larger weight to the closer observations).
}
  \item{minpausedur}{
Numeric. If every point is within a minpausedist meter radius of each other in a mobility trace after a period of minpausedur seconds or more, it is assumed that the person has paused at this location.
}
  \item{minpausedist}{
Numeric. If every point is within a minpausedist meter radius of each other in a mobility trace after a period of minpausedur seconds or more, it is assumed that the person has paused at this location.
}
  \item{rad_fp}{
Numeric. Default is sqrt(10). After averaging pings in 10 second intervals, a flight is interrupted if two adjacent averaged locations are within rad_fp meters of each other.}
  \item{wid_fp}{
Numeric. Default is 10+mean(accuracy). After averaging pings in 10 second intervals, wid_fp is the allowable distance in meters that a ping can be from the flight. Any ping outside of this distance imply that the flight is not straight and must be subdivided into multiple flights.
}

}
\details{
This function will search the given fildir directory for all .csv files and will assume they are all part of the same mobility trace. Therefore, no extraneous .csv files should be kept in the fildir directory. Mobility trace plots will be output to fildir as well.
}
\value{
A list with four values:

-"mobmat": this is a mobility matrix. This matrix has 7 columns.
1) Event code. 1=flight, 2=pause, 3=unclassified, 4=missing data.
2) x coordinate of the starting location.
3) y coordinate of the starting location.
4) time of the start of the event (seconds from epoch)
5) x coordinate of the ending location (if applicable).
6) y coordinate of the ending location (if applicable).
7) time of the end of the event (seconds from epoch).

-"featsims": This is a list of mobility measures, one for each of the nreps simulations. There is a row for each day in the data set. There is a column for each measure. The measures are:
			--Hometime:			Time spent at home (minutes)	
			--DistTravelled:		Distance travelled (meters)
			--RoG:				Radius of gyration (meters)
			--MaxDiam:			Maximum diameter (longest distance between any two points) (meters)
			--MaxHomeDist:		Maximum distance from home (meters)
			--SigLocsVisited:	Number of significant locations visited that day
			--AvgFlightLen:		Average length of flights on that day (meters)
			--StdFlightLen:		Standard deviation of the length of flights on that day (meters)		
			--AvgFlightDur:		Average time flights took on that day (seconds)
			--StdFlightDur:		Standard deviation of the time flights took on that day (seconds)
			--ProbPause:			Probability (fraction of time) a person is stationary (paused) during a day (as opposed to mobile/in flight)
			--SigLocEntropy:		Location entropy across a person's significant locations for the day.
			--MinsMissing:		Number of minutes of missing data in a person's GPS mobility trace that day.
			--CircdnRtn:			Circadian routine measuring similarity in a person's locations over the course of a day to that of the other days in the data set. Numeric between 0 and 1. 1=identical routine, 0=completely different routine.
			--WkEndDayRtn:		Similar to the CircdnRtn measure, except comparisons are stratified by grouping together weekends and grouping together weekdays into two separate groups.

-"siglocsims": This is a list of the significant locations, one for each of the nreps simulations. Each list element is a matrix with 4 columns. The 4 columns are the x and y coordinates of the significant location, the amount of time present (within CENTERRAD meters) at that location, and an indicator of which significant location is determined to be a person's home.

-"featavg": This is a matrix that averages all of the matrices contained in the list elements of "featsims". This represents the average mobility measures over all simulations, and should be used for analyses.
}
\references{
}
\author{
Ian Barnett
}
\note{
The mobility measure matrices in "featsims" and in "featavg" that appear in the output each have a column for each day present in the GPS trace. Therefore the first and last days may be truncated depending on when data collection began/stopped, so the mobility measures on these days may be biased heavily. Because of this, depending on the analysis it may be wise to ignore both the first and last days.
}


\seealso{
\code{\link{plot.flights}}
\code{\link{ExtractTimePeriod}}
\code{\link{SimulateMobilityGaps}}
}
\examples{
}
\keyword{ manip}
