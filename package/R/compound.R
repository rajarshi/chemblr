get.compounds <- function(ids, type='chemblid') {
  valid.types <- c('chemblid', 'stdinchi')
  type <- pmatch(type, valid.types)
  if (is.na(type)) stop("Invalid type specified")
  url <- switch(type,
                url = 'https://www.ebi.ac.uk/chemblws/compounds/',
                url = 'https://www.ebi.ac.uk/chemblws/compounds/stdinchikey/')
  urls <- sapply(ids, function(id) sprintf("%s%s.json", url, id))
  d <- getURL(urls, async=TRUE)
  ret <- lapply(d, function(x) {
    if (x == "") return(NA)
    else {
      return(data.frame(fromJSON(x), stringsAsFactors=FALSE))
    }
  })
  if (all(is.na(ret))) stop("All responses undefined")
  
  ## get unique set of col names
  cn <- unique(unlist(lapply(ret, names)))
  ret <- do.call(rbind, lapply(ret, function(x) {
    ccn <- names(x) ## ccn is always a subset of cn
    tret <- x
    ## see if any are missing
    idx <- which(is.na(match(cn, ccn)))
    if (length(idx) > 0) {
      for (i in 1:length(idx))
        tret <- cbind(tret, NA)
      s <- ncol(tret)-length(idx)+1
      e <- ncol(tret)
      names(tret)[s:e] <- cn[idx]
    }
    return(tret)
  }))
  names(ret) <- gsub("^compound.", "", names(ret))
  rownames(ret) <- NULL
  return(ret)
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
