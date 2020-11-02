#' Gets 'agnation' from a systemic functional network input.
#'
#' This function gets agnation from input systems
#' @param df The dataframe with a initial column 'features'.
#' @param sorted Logical. FALSE by default. If TRUE, agnation arrays increasingly
#'
#' @return The agnation of each feature in the system from dataframe row
#'
#' @examples
#' agnation(mood_spanish)
#'features$features       agnacion
#' 1 menor                    2
#' 2 major                    2
#' 3 indicative               2
#' 4 imperative               2
#'
#' @export agnation


agnation <- function(df, sorted = FALSE) {

  n_rasgos <- str_count(df$features, "/") + 1

  df$agnacion <- n_rasgos %>%
    purrr::map(.agnation_int) %>%
    as.numeric(.$agnacion)

  opcion <- getFeatures(df[1]) %>%
    as.data.frame()

  df <- df[rep(seq_len(nrow(df)), n_rasgos),]

  df$features <- opcion

  ifelse(!sorted, return(df), return(arrange(df, agnacion)))

}
