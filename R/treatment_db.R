#' Traiter la donnee
#'
#' @param data data from \link[data.gouv.fr]{https://www.data.gouv.fr/en/datasets/open-food-facts-produits-alimentaires-ingredients-nutrition-labels/} 
#'
#' @importFrom dplyr filter select
#' @importFrom tidyr drop_na
#' @return data
#' @export
#'
treatment_db <- function(data){
    vars <- c("product_name",
              "generic_name", 
              "countries_fr", 
              "nutrition_grade_fr",
              "countries_tags",
              "nutrition-score-fr_100g",
              "nutrition-score-uk_100g",
              "main_category_fr", 
              "additives_n",
              "additives_fr", 
              "labels_fr",
              "categories_fr")
    
     if(!names(data) %in% vars){
       stop("Are you sure about the data ? Comes from data.gouv.fr ?")
     }
    
    data %>%
    filter(nutrition_grade_fr != "United States" | !is.na(nutrition_grade_fr)) %>%
    select(vars) %>% 
    drop_na()
}