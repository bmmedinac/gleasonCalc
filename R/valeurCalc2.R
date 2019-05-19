#' Gets 'valeur' from a systemic functional network input
#'
#' This 2nd version full function gets valeur from input systems. Also, gets delicacy, agnation, feature's valeur and subsystem's valeur. It requires `stringr` package
#' @param df The dataframe with a initial column named 'features'.
#' @param sorted Logical. FALSE by default. If TRUE, valeur_feature arrays increasingly
#'
#' @return The valeur of each feature in the system
#'
#' @examples
#'
#' @export valeurCalc2
#'
#' @import stringr


valeurCalc2 <- function(df, sorted = FALSE){
  n_features <- str_count(df$features, "/") + 1

  df$agnation <- n_features %>%
    purrr::map(.agnation_int) %>%
    as.numeric(.$agnation)

  coseleccion <- str_count(df$features, "&") # is it working co-selection?

  nivel_max <- (str_count(df$features, ":"))/(str_count(df$features, "/") +1) +1 %>%
    as.integer()

  df$delicacy <- nivel_max %>%
    purrr::map(delicacy_subsist) %>%
    as.numeric(.$delicacy)

  valeur_sistema <- df$agnation + df$delicacy # es necesario revisarlo aun. Por mientras, no incluirlo
  df$valeur <- valeur_subsist(a = df$agnation, d = df$delicacy)

  option <- getFeatures(df[1]) %>%
    as.vector()

  df <- df[rep(seq_len(nrow(df)), n_features),]

  df[,"features"] <- option

  ifelse(!sorted, return(df), return(arrange(df, valeur)))
}
