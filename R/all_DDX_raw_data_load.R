#' Load all alpha CSV files into a dataframe
#'
#' @param path_to_files Path to the directory containing the alpha .csv files
#' @param ND_is_zero Replaces ND values with 0 (TRUE) or Detection Limit (FALSE), or neither (NEITHER). Defaults to TRUE
#'
#' @return Dataframe with SampleID, Station, Depth, and Concentration. Detection Limit is included when NEITHER is selected.
#' @export
#'
#' @examples
all_DDX <- function(path_to_files, ND_is_zero = TRUE){

  files <- list.files(path = path_to_files, pattern="*.csv", full.names = TRUE)

  all_alpha <- data.frame()

  for (x in 1:length(files)) {
    print(files[x])
    alpha_DDX <- DDX(files[x]) %>%
      filter(Station != "FIELD BLANK")

    all_alpha <- rbind(all_alpha, alpha_DDX)
  }

  # Arrange by station and depth
  all_alpha <- all_alpha %>%
    arrange(Station, Depth)

  # Replace ND values with 0
  all_alpha_ND_is_zero <- all_alpha %>%
    mutate(Concentration_ug_kg = if_else(Concentration_ug_kg == "ND",
                                         true = 0,
                                         false = as.numeric(Concentration_ug_kg))) %>%
    select(-Detection.Limit)

  #Replace ND values with detection limit
  all_alpha_ND_is_not_zero <- all_alpha %>%
    mutate(Concentration_ug_kg = if_else(Concentration_ug_kg == "ND",
                                         true = as.numeric(Detection.Limit),
                                         false = as.numeric(Concentration_ug_kg))) %>%
    select(-Detection.Limit)

  #Return one of them
  if (ND_is_zero == "NEITHER") return(all_alpha)
  if (ND_is_zero) return(all_alpha_ND_is_zero)
  if (!ND_is_zero) return(all_alpha_ND_is_not_zero)

}
