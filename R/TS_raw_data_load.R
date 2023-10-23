#' Title
#'
#' @param dataset
#'
#' @return
#' @export
#'
#' @examples
TS <- function(dataset){
  read.csv(dataset) %>%
    filter(Analysis == "Solids, Total") %>%
    separate(Client.ID, c("Station","Depth","Replicate"), "-") %>%
    rename("Concentration_perc" = "Concentration") %>%
    select(Sample.ID, Station, Depth, Concentration_perc)
}
