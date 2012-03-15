get.chembl.status <- function() {
  url <- 'http://www.ebi.ac.uk/chemblws/status/'
  d <- getURL(url)
  print(d)
}
