\name{get.compound}
\alias{get.compound}
\title{
  Retrieve Compound Information from ChEMBL
}
\description{
These functions allow one to retrieve compounds information from ChEMBL for single compounds or for 
lists of compounds. In the former case, compounds are identified either by a ChEMBL ID or by a 
standard InChI key. In the latter case, compounds lists can b e obtained via canonical SMILES, substructure
or by similarity.
}
\usage{
get.compound(id, type='chemblid')
}
\arguments{
\item{id}{A string representing the ChEMBL ID or a standard InChI key of the molecule to be depicted}
\item{type}{One of \code{chemblid} or \code{stdinchi} to indicate the nature of the molecule id}
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
}
\keyword{programming}
\author{Rajarshi Guha (\email{rajarshi.guha@gmail.com})}
