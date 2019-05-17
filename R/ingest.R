#' nadp_ls
#'
#' @param version_id character version id
#' @param ... extra arguments passed to list.files
#'
#' @export
#'
#' @examples \dontrun{
#' nadp_ls()
#' }
nadp_ls <- function(version_id = 1, ...){
  list.files(
    list.dirs(paste0(cache_path(), version_id), recursive = FALSE),
    pattern = "\\.zip$", ...)
}
