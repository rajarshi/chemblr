\name{get.activity}
\alias{get.activity}
\alias{get.assay}
\title{
  Retrieve Bioactivity Information for Compounds, Targets or Assays
}
\description{
This method retrieves bioactivity information for a compound across multiple targets/assays or else for 
a target across multiple compounds. The function can also be used to retrieve all activities within a given
assay. In all cases, ChEMBL identifiers must be used.
}
\usage{
get.activity(chembl.id, type='compound')
get.assay(chembl.id)
}
\arguments{
\item{chembl.id}{A string representing the ChEMBL ID for a compound, target or assay}
\item{type}{One of \code{compound}, \code{assay} or \code{target}. Partial matching is supported}
}
\value{
\code{get.assay} returns a list with the following named fields:
\itemize{
\item chemblId
\item assayType
\item journal
\item assayOrganism
\item assayStrain
\item assayDescription
\item numBioactivities
}

\code{get.activity} returns a \code{data.frame} with the following columns:
\itemize{
\item value
\item reference
\item organism
\item parent_cmpd_chemblid
\item ingredient_cmpd_chemblid
\item target_chemblid
\item target_confidence
\item target_name
\item name_in_reference
\item bioactivity_type
\item activity_comment
\item operator
\item units
\item assay_chemblid
\item assay_type
}
}
\seealso{
\code{\link{get.compound}},
\code{\link{get.compound.list}},
}
\keyword{programming}
\author{Rajarshi Guha (\email{rajarshi.guha@gmail.com})}
