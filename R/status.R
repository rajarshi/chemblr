get.chembl.status <- function() {
  url <- 'https://www.ebi.ac.uk/chemblws/status/'
  d <- getURL(url)
  return(d == 'UP')
}
