#' Gets valeur for each level (ie subsystem) from a  systemic functional network input
#'
#' This function gets valeur for each level (ie subsystem) from input systems
#' @param df The dataframe with a initial column 'features'.
#'
#' @return The  valeur (ie delicacy x agnation) of each feature in the system
#'
#' @examples
#' valeur_subsist(df$features)
#'
#' @export valeur_subsist

valeur_subsist = function(a,d){
  indexAg = 1:a
  indexDe = 1:d
  v = a * d
  return(v)
}
