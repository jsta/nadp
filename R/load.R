#' nadp_load
#' @description Load files from local file system
#' @param years numeric year
#' @param products product string
#' @param fpath file.path optionally specify custom location of rds file
#' @export
#' @importFrom raster raster
#' @examples \dontrun{
#' dt  <- nadp_load(2010, "totalN")
#' }
nadp_load <- function(years, products, fpath = NA){

  if(!is.na(fpath)){
    raster::raster(tif_path)
  }else{
      tif_path <- paste0(cache_path(), "1/", product_string(years, products))
      stop_if_not_exists(tif_path)
      raster::raster(tif_path)
  }
}
