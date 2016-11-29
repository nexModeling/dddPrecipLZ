#' Precipiation field in to LZ precipitation field
#'
#' Precipiation field in to LZ precipitation field
#' @param precip precipitation field
#' @param modelPrecipLZ  list(nbLevelZone,Plr,hfelt,midmetp)
#' @keywords precipLZ
#' @export
#' @examples
#' \dontrun{
#' lz()
#' }
lz <- function(precip,modelPrecipLZ){
  precipLZ <- precip*(1.0+modelPrecipLZ$Plr*((modelPrecipLZ$hfelt-modelPrecipLZ$midmetp)/100.0))
  return(precipLZ)
}
