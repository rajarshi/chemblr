get.compound <- function(id, type='chemblid') {
  valid.types <- c('chemblid', 'stdinchi')
  type <- pmatch(type, valid.types)
  if (is.na(type)) stop("Invalid type specified")
  url <- switch(type,
                url = 'https://www.ebi.ac.uk/chemblws/compounds/',
                url = 'https://www.ebi.ac.uk/chemblws/compounds/stdinchikey/')
  url <- sprintf('%s%s.json', url, id)
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

get.compound.list <- function(id, type='cansmi') {
  valid.types <- c('cansmi', 'substructure', 'similarity')
  type <- pmatch(type, valid.types)
  if (is.na(type)) stop("Invalid type specified")
  url <- switch(type,
                url = 'https://www.ebi.ac.uk/chemblws/compounds/smiles/',
                url = 'https://www.ebi.ac.uk/chemblws/compounds/substructure/',
                url = 'https://www.ebi.ac.uk/chemblws/compounds/similarity/')
  url <- sprintf('%s%s.json', url, id)
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
