#' Get the observations
#'
#' Get and process, if needed, the observations
#' @param method method for processing observations, "lz", "processedNVE"
#' @param path Directory where to get the files
#' @param filename Filename (path included) of the file to be read
#' @param modelPrecipLZ  list(nbLevelZone,Plr,hfelt,midmetp)
#' @keywords precipLZ
#' @export
#' @examples
#' \dontrun{
#' getPrecipLZ()
#' }
getPrecipLZ <- function(method=NULL,path=NULL,filename=NULL,modelPrecipLZ=NULL) {

    precipLZ <- switch(method,
<<<<<<< HEAD
                   "processedNVE"        = getPrecipLZ.processedNVE(path=path,filename=filename),
=======
                   "processedNVE" = getPrecipLZ.processedNVE(path=path,filename=filename),
>>>>>>> refs/remotes/origin/dev
                   "lz"          = getPrecipLZ.lz(path=path,filename=filename,modelPrecipLZ=modelPrecipLZ),
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


getPrecipLZ.lz <- function(path,filename,modelPrecipLZ){
  env <- environment()
  path <- normalizePath(file.path(path,filename),mustWork = FALSE)
  tmp <- utils::read.table(path,sep="\t")
  assign("precip",tmp[,5],envir=env)
  rm(tmp)
  precipLZ <- get("precip",envir=env)*(1.0+modelPrecipLZ$Plr*((modelPrecipLZ$hfelt-modelPrecipLZ$midmetp)/100.0))
  return(precipLZ)
}
