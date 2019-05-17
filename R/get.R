#' nadp_get
#'
#' @export
#' @description Retrieves external files and store in file cache.
#' @importFrom rappdirs user_data_dir
#' @importFrom utils download.file unzip
#' @param years numeric year
#' @param products product string
#' @param dest_folder file.path optional will default to the location returned by \code{\link[rappdirs]{user_data_dir}}.
#' @examples \dontrun{
#' nadp_get(years = 2010, products = "TotalN")
#' }
nadp_get <- function(years, products, dest_folder = NA){
  version_id <- 1

  # See http://nadp.slh.wisc.edu/NTN/annualmapsByYear.aspx
  baseurl <- "http://nadp.slh.wisc.edu/maplib/grids/"

  # years    <- c(2009, 2010)
  # products <- c("hplus", "TotalN")
  files <- apply(expand.grid(years, products), 1, function(x)
        paste0(x[1], "/", x[2], "_dep_", x[1], ".zip"))

  # dir.exists(cache_path())
  dir.create(cache_path(), showWarnings = FALSE)
  versioned_path <- paste0(cache_path(), version_id)
  dir.create(versioned_path, showWarnings = FALSE)
  sapply(years, function(x) dir.create(paste0(
    cache_path(), version_id, "/", x), showWarnings = FALSE))

  invisible(
    lapply(files,
           function(x) get_if_not_exists(
             paste0(baseurl, x), file.path(versioned_path, x))
    ))

  invisible(
    lapply(files, function(x)
      unzip(file.path(versioned_path, x),
          exdir = versioned_path, junkpaths = TRUE)
      ))
}
