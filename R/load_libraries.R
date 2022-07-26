#' Load libraries
#'
#' Load libraries
#'
#' @param librairies A list of libraries
#'
#' @export
load_libraries <- function(librairies) {
    for (l in librairies) {
        suppressPackageStartupMessages(
            library(
                l,
                character.only = TRUE,
                warn.conflicts = FALSE,
                quietly = TRUE,
                verbose = FALSE
            )
        )
    }
}
