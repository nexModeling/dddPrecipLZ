#' Get the observations
#'
#' Get and process, if needed, the observations
#' @param method method for processing observations, "lz", "processedNVE"
#' @param path Directory where to get the files
#' @param filename Filename (path included) of the file to be read
#' @param ... options for the different methods
#' @keywords precipLZ
#' @export
#' @examples
#' \dontrun{
#' getPrecipLZ()
#' }
getPrecipLZ <- function(method=NULL,path=NULL,filename=NULL,...) {

    precipLZ <- switch(method,
                   "processedNVE" = getPrecipLZ.processedNVE(path=path,filename=filename),
                   "lz"           = getPrecipLZ.lz(path=path,filename=filename,...),
                   "perturbation" = getPrecipLZ.perturbation(path=path,filename=filename,...),
                   (message=paste0("Invalid method:", method,".")))
    return(precipLZ)
}


getPrecipLZ.processedNVE <- function(path,filename){
  env <- environment()
  path <- normalizePath(file.path(path,filename),mustWork = FALSE)
  tmp <- utils::read.table(path,sep="\t")
  assign("precipLZ",tmp[,5:14],envir=env)
  rm(tmp)
  return(get("precipLZ",envir=env))
}


getPrecipLZ.lz <- function(path,filename,...){
  env <- environment()
  path <- normalizePath(file.path(path,filename),mustWork = FALSE)
  tmp <- utils::read.table(path,sep="\t")
  assign("precip",tmp[,5],envir=env)
  rm(tmp)
  precipLZ <- lz(precip=get("precip",envir=env),...)
  return(precipLZ)
}

getPrecipLZ.perturbation <- function(path,filename,...){
  env <- environment()
  path <- normalizePath(file.path(path,filename),mustWork = FALSE)
  tmp <- utils::read.table(path,sep="\t")
  assign("precipLZ",tmp[,5:14],envir=env)
  rm(tmp)
  res <- perturbation(precip=get("precipLZ",envir=env),...)
  return(res)
}
