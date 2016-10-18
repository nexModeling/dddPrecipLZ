#' Precipitation for each elevation zone
#'
#' The function \code{stateX()} processes the precipitation for each elevation zone
#' @param v precipitation value (scalar)
#' @param modelPrecipLZ
#'  list(nbLevelZone,Plr,hfelt,midmetp)
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
