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
#' @import tidyr

getFeatures <- function(df, coselection = FALSE){

  #This first 'if' statement search co-selections (&) in input. If & == 0, then run this if statement

  if (str_count (df$features, "&") == 0){
    truth <- sapply(df,is.character) #search for characters in features column
    options <- df %>% # create 'option' variable
      separate_rows (features, sep = ":") %>% # separate rows with ':' (delicacy) into a new row
      separate_rows (features, sep = "/") # separate rows with "/" (contrast) into a new row
    # inserts features' names into first column. Also deletes white spaces in features' names
    options <- data.frame(cbind(sapply(options[,truth],
                                       trimws,
                                       which="both"),
                                options[,!truth])) %>%
      unique()
  }
  # If system does have co-selection, BUT coselection == FALSE, then getFeatures prints one feature at a time (eg cognition, and NOT cognition & as-process)

  else {
    if (coselection == FALSE){
      truth <- sapply(df,is.character)
      options <- df %>%
        separate_rows (features, sep = ":") %>%
        separate_rows (features, sep = "/") %>%
        separate_rows (features, sep = "&")
      options <- data.frame(cbind(sapply(options[,truth],
                                         trimws,
                                         which="both"),
                                  options[,!truth])) %>%
        unique() # searchs and prints just unique features
    }

    # If system does have co-selection, AND coselection == TRUE, then getFeatures print features with their coselections (eg cognition & as-process)

    else {
      truth <- sapply(df,is.character)
      options <- df %>%
        separate_rows (features, sep = ":") %>%
        separate_rows (features, sep = "/")
      options <- data.frame(cbind(sapply(options[,truth],
                                         trimws,
                                         which="both"),
                                  options[,!truth])) %>%
        unique()
    }

  }

  ifelse(!coselection, return(options), return(options)) #returns features packages in options
}
