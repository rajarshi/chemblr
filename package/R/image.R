get.depiction <- function(chembl.id, size = 200, ...) {
  if (is.null(size) || is.na(size) || size <= 0) size <- 200
  url <- sprintf("https://www.ebi.ac.uk/chemblws/compounds/%s/image?dimensions=%d", chembl.id, size)
  h <- getCurlHandle()
  d <- getURL(url, curl=h)
  status <- getCurlInfo(h)$response.code
  ctype <- getCurlInfo(h)$content.type
  rm(h)
  if (status == 200) {
    return(readPNG(d, ...))
  } else {
    return(NULL)
  }
}
