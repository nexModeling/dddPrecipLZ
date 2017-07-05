#' Precipiation field in to LZ precipitation field
#'
#' Precipiation field in to LZ precipitation field
#' @param precip precipitation field
#' @param modelPert  list(ditr,param)
#' @keywords precipLZ
#' @export
#' @examples
#' \dontrun{
#' perturbation()
#' }

perturbation <- function(precip,modelPert){
  precip <- as.matrix(precip)
  nc <- ncol(precip)
  nr <- nrow(precip)
  n <- nc*nr
  res <- precip*matrix(stats::rnorm(n=n,mean=0,sd=modelPert$sig*precip),ncol=nc,nrow=nr)
  res[which(res<0)] <- 0
  return(res)
}
