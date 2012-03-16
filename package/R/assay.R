get.activity <- function(chembl.id, type='compound') {
  valid.types <- c('compound', 'target', 'assay')
  type <- pmatch(type, valid.types)
  if (is.na(type)) stop("Invalid type specified")
  url <- switch(type,
                url = 'https://www.ebi.ac.uk/chemblws/compounds/%s/bioactivities.json',
                url = 'https://www.ebi.ac.uk/chemblws/targets/%s/bioactivities.json',
                url = 'https://www.ebi.ac.uk/chemblws/assays/%s/bioactivities.json')
  url <- sprintf(url, chembl.id)
  h <- getCurlHandle()
  d <- getURL(url, curl=h)
  status <- getCurlInfo(h)$response.code
  ctype <- getCurlInfo(h)$content.type
  rm(h)
  if (status == 200) {
    ret <- data.frame(do.call('rbind', fromJSON(d)[[1]]), stringsAsFactors=FALSE)
    ret$value <- as.numeric(ret$value)
    ret$target_confidence <- as.numeric(ret$target_confidence)
    return(ret)
  } else {
    return(NULL)
  }
}

get.assay <- function(chembl.id) {
  url <- sprintf("https://www.ebi.ac.uk/chemblws/assays/%s.json", chembl.id)
  h <- getCurlHandle()
  d <- getURL(url, curl=h)
  status <- getCurlInfo(h)$response.code
  ctype <- getCurlInfo(h)$content.type
  rm(h)
  if (status == 200) {
    return(fromJSON(d)[[1]])
  } else {
    return(NULL)
  }
}
