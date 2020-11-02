#' Gets 'agnation' from a systemic functional network input
#'
#' This function gets agnation from input systems
#' @param df The dataframe with a initial column 'features'.
#'
#' @return The agnation of each feature in the system from dataframe row
#'
#' @examples
#' agnation(df$features)
#'
#' @export .agnation_int


.agnation_int <- function(opositions) {
  agn <- opositions*(factorial(opositions)/(factorial(2)*factorial(opositions - 2)))
  return(agn)
}
