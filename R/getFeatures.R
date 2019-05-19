#' Gets all singular features from a systemic functional network input
#'
#' This function gets all the features from input systems. Since input systems are complex in their structure, this functions clears opositions and lower delicacy levels. It requires `stringr` library

#' @param df The dataframe with a initial column named 'features'.
#'
#' @return The features of each complex system structure in the 'features' column
#'
#' @examples
#'
#' @export getFeatures
#'
#' @import stringr
#'

getFeatures <- function(df, coselection = FALSE){

  if (str_count (df$features, "&") == 0){
    truth <- sapply(df,is.character)
    options <- df %>%
      separate_rows (features, sep = ":") %>%
      separate_rows (features, sep = "/")
    options <- data.frame(cbind(sapply(options[,truth],trimws,which="both"),options[,!truth])) %>%
      unique()
  }

  else {
    if (coselection == FALSE){
      truth <- sapply(df,is.character)
      options <- df %>%
        separate_rows (features, sep = ":") %>%
        separate_rows (features, sep = "/") %>%
        separate_rows (features, sep = "&")
      options <- data.frame(cbind(sapply(options[,truth],
                                         trimws,which="both"),
                                  options[,!truth])) %>%
        unique()
    }

    else {
      truth <- sapply(df,is.character)
      options <- df %>%
        separate_rows (features, sep = ":") %>%
        separate_rows (features, sep = "/")
      options <- data.frame(cbind(sapply(options[,truth],
                                         trimws,which="both"),
                                  options[,!truth])) %>%
        unique()
    }

  }

  ifelse(!coselection, return(options), return(options))
}
