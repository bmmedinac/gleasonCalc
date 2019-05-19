#' Gets maximun delicacy level from a full systemic functional network input
#'
#' This function gets maximum delicacy from input systems
#' @param df The dataframe with a initial column 'features'.
#'
#' @return The maximun delicacy (ie maximum level) of each feature in the system
#'
#' @examples
#' delicacy_sist(df$features)
#'
#' @export delicacy_sist

delicacy_sist = function(max_level){
  index = 1:max_level
  if (options >= 2) {
    del = sum(index * 1)
  }
  else
    del = index * max_level
  return(del)
}
