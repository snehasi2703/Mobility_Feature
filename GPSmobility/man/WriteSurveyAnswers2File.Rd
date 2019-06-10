\name{WriteSurveyAnswers2File}
\alias{WriteSurveyAnswers2File}

\title{
Writes survey answers to a single file
}
\description{
Survey answers are concatenated together to form a single tab delimited text file.
}
\usage{
WriteSurveyAnswers2File(fildir,survey_id,SID)
}

\arguments{
  \item{fildir}{
  File directory containing survey answers.
}
  \item{survey_id}{
  The ID of the survey of interest. There should be a subdirectory within fildir of the same name.
}
  \item{SID}{
  The subject ID.
}
}
\details{
Gathers all answers of the survey survey_id for subject SID and writes them together in a tab delimited text file.
}
\value{
No return value.
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
