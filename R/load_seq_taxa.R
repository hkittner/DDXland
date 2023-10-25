
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
  seqtab <- data.frame(fread(paste("C:/Users/haili/OneDrive/Desktop/GradSchoolThings/DDT/DDX_analysis/data/raw_data/microbes/seq.table_", date, ".csv", sep =""), header = TRUE, check.names = FALSE), row.names = 1)

  # Load sequence identity table
  taxa <- read.csv(paste("C:/Users/haili/OneDrive/Desktop/GradSchoolThings/DDT/DDX_analysis/data/raw_data/microbes/taxa_", date, ".csv", sep = ""), header = TRUE, check.names = FALSE, row.names = 1)


}

