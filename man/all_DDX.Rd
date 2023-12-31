% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/all_DDX_raw_data_load.R
\name{all_DDX}
\alias{all_DDX}
\title{Load all alpha CSV files into a dataframe}
\usage{
all_DDX(path_to_files, ND_is_zero = TRUE)
}
\arguments{
\item{path_to_files}{Path to the directory containing the alpha .csv files}

\item{ND_is_zero}{Replaces ND values with 0 (TRUE) or Detection Limit (FALSE), or neither (NEITHER). Defaults to TRUE}
}
\value{
Dataframe with SampleID, Station, Depth, Replicate, and Concentration. Detection Limit is included when NEITHER is selected.
}
\description{
Load all alpha CSV files into a dataframe
}
