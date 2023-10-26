#' Title
#'
#' @param dataset
#'
#' @return
#' @export
#'
#' @examples
DDX <- function(dataset){
  read.csv(dataset) %>%
    filter(Analysis == "2,4'-DDE" |
             Analysis == "4,4'-DDE" |
             Analysis == "2,4'-DDD" |
             Analysis == "4,4'-DDD" |
             Analysis == "2,4'-DDT" |
             Analysis == "4,4'-DDT" |
             Client.ID != "FIELD BLANK") %>%
    mutate(Analysis = if_else(Analysis == "2,4'-DDT",
                              true = "2_4_DDT",
                              false = Analysis),
           Analysis = if_else(Analysis == "4,4'-DDT",
                              true = "4_4_DDT",
                              false = Analysis),
           Analysis = if_else(Analysis == "2,4'-DDE",
                              true = "2_4_DDE",
                              false = Analysis),
           Analysis = if_else(Analysis == "4,4'-DDE",
                              true = "4_4_DDE",
                              false = Analysis),
           Analysis = if_else(Analysis == "2,4'-DDD",
                              true = "2_4_DDD",
                              false = Analysis),
           Analysis = if_else(Analysis == "4,4'-DDD",
                              true = "4_4_DDD",
                              false = Analysis)) %>%
    separate(Client.ID, c("Station","Depth","Replicate"), "-") %>%
    rename("Concentration_ug_kg" = "Concentration") %>%
    rename("Compound" = "Analysis") %>%
    filter(Depth != "B") %>%
    select(Sample.ID, Station, Depth, Replicate, Compound, Concentration_ug_kg, Detection.Limit)
}
