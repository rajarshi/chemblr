get.chembl.status <- function() {
  url <- 'https://www.ebi.ac.uk/chemblws/status.json'
  d <- fromJSON(getURL(url))
  return(d$service$status == 'UP')
}
