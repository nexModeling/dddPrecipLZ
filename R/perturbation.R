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
  res <- precip+rnorm(n=1,mean=0,sd=modelPert$sig)
  return(res)
}
