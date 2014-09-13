\name{get.compound}
\alias{get.compound}
\alias{get.compound.list}
\title{
  Retrieve Compound Information from ChEMBL
}
\description{
These functions allow one to retrieve compounds information from ChEMBL for single compounds or for 
lists of compounds. In the former case, compounds are identified either by a ChEMBL ID or by a 
standard InChI key. In the latter case, compounds lists can b e obtained via canonical SMILES, substructure
or by similarity.

Note that similarity based queries seem to be very slow and in many cases time out.
}
\usage{
get.compounds(ids, type='chemblid')
get.compound.list(id, type='cansmi')
}
\arguments{
\item{id}{A character vector representing the ChEMBL ID or a standard InChI key of the molecule to be depicted}
\item{type}{For \code{get.compounds}, one of \code{chemblid} or \code{stdinchi} to indicate the nature 
of the molecule id. For the case of \code{get.compound.list} valid types are \code{cansmi}, \code{substructure} and
\code{similarity}. Partial matching is supported}
}
\value{
\code{get.compound} returns a list with the following named fields:
\itemize{
\item chemblId
\item numRo5Violations
\item alogp
\item knownDrug
\item medChemFriendly
\item rotatableBonds
\item passesRuleOfThree
\item molecularFormula
\item smiles
\item stdInChiKey
\item acdlogp
\item acdlogd
}
Currently this function retrieves a single molecule at a time. To retrieve multiple molecules, you must
manually call this function for each identifier.

\code{get.compound.list} returns a list of objects, where each object is a list with the same fields as noted above.
}
\seealso{
\code{\link{get.assay}},
\code{\link{get.activity}}
}
\keyword{programming}
\author{Rajarshi Guha (\email{rajarshi.guha@gmail.com})}
