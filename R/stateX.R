#' Precipitation for each elevation zone
#'
#' The function \code{stateX()} process the precipitation for each elevation zone
#' @param v precipitation value (scalar)
#' @param modelPrecipLZ
#'  list(nbLevelZone=a,Plr=b,hfelt=c,midmetp=d)
#' @keywords precipLZ
#' @export
#' @examples
#' \dontrun{
#' stateX()
#' }
stateX <- function(v,modelPrecipLZ) {
  res <- v*(1.0+modelPrecipLZ$Plr*((modelPrecipLZ$hfelt-modelPrecipLZ$midmetp)/100.0))
  return(res)
}
