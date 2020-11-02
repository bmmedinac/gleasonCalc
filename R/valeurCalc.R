#' Gets 'valeur' from a systemic functional network input
#'
#' This full function gets vavaleurlue from input systems. Also, gets delicacy subsystem, max delicacy (level), agnation, and valeur subsystem.
#' @param df The dataframe with a initial column 'features'.
#'
#' @return The valeur of each feature in the system
#'
#' @examples
#'
#' @export valeurCalc


valeurCalc <- function(df){
  ## paquetes
  library(stringr)

  ##Prepara funciones
  agnation <- function(opositions) {
    agn <- opositions*(factorial(opositions)/(factorial(2)*factorial(opositions - 2)))
    return(agn)
  }


  delicacy_sist = function(max_level){
    index = 1:max_level
    if (options >= 2) {
      del = sum(index * 1)
    }
    else
      del = index * max_level
    return(del)
  }


  delicacy_subsist = function(level){
    del = (level ^ 2) * 1
  }


  valeur_subsist = function(a,d){
    indexAg = 1:a
    indexDe = 1:d
    v = a * d
    return(v)
  }


  valeur_feature = function(a,d){
    indexAg = 1:a
    indexDe = 1:d
    v = a * d
    return(v)
  }


  df$n_rasgos <- str_count(df$features, "/") + 1

  df$agnacion <- df$n_rasgos %>%
    purrr::map(agnation) %>%
    as.numeric(.$agnacion)

  coseleccion <- str_count(df$features, "&")

  df$nivel_max <- str_count(df$features, ":") + 1

  df$delicadeza_sub <- df$nivel_max %>%
    purrr::map(delicacy_subsist) %>%
    as.numeric(.$delicadeza)

  df$valor_sistema <- valeur_subsist(a = df$agnacion, d = df$delicadeza)
  df$valor_rasgo <- df$agnacion + df$delicadeza

  return(df)
}

