\name{get.depiction}
\alias{get.depiction}
\alias{depiction}
\title{
  Retrieve PNG Depiction of Structure
}
\description{
This function returns a raster representing a 2D depiction of the specified ChEMBL ID.
}
\usage{
get.depiction(chembl.id, size = 200, ...)
}
\arguments{
\item{chembl.id}{A string representing the ChEMBL ID of the molecule to be depicted}
\item{size}{The length or width of the image. Images are always square}
\item{...}{Extra arguments to \code{readPNG}}
}
\value{
A raster image of the depiction that can either be an array of pixels (easier to compute on) or else
a native raster that is more efficient to draw with.
}
\seealso{
\code{\link{readPNG}}
}
\keyword{programming}
\author{Rajarshi Guha (\email{rajarshi.guha@gmail.com})}
