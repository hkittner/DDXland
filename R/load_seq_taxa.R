
#' Load Sequence and Taxa Tables
#'
#' @param date Character value of the date associated with dataset.
#'
#' @return Files are loaded into environment
#' @export
#'
#' @examples
load_seq_taxa <- function(date = "230212"){

  # Load sequence abundance table
  seqtab <- data.frame(fread(paste("../../data/raw_data/microbes/seq.table_", date, ".csv", sep =""), header = TRUE, check.names = FALSE), row.names = 1)

  # Load sequence identity table
  taxa <- read.csv(paste("../../data/raw_data/microbes/taxa_", date, ".csv", sep = ""), header = TRUE, check.names = FALSE, row.names = 1)

  # Load map file
  map_SPB <- read.csv("../../data/raw_data/microbes/map_SPB.csv", row.names = 1)

}

