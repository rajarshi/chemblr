This R package wraps the [REST API](https://www.ebi.ac.uk/chembldb/index.php/ws) provided by the [ChEMBL](https://www.ebi.ac.uk/chembldb/) SAR database. Currently, the package provides access to compound, assay and bioactivity information. The methods interact with the JSON formatted data and return data.frame or list objects. Due to the nature of the ChEMBL API, many operations occur only on single ChEMBL identifiers, and thus retrieving data for multiple identifiers must be performed manually.

The R package requires the RCurl, RJSONIO and png packages to be installed. Since the appropriate methods return SMILES strings (and some also accept them as input), use of the [rcdk](http://cran.r-project.org/web/packages/rcdk/index.html) package can be useful, to support cheminformatics directly in the R environment


## Installation

To get the latest development version from github:

```R
# install.packages('devtools')
devtools::install_github('rajarshi/chemblr/package')
```
