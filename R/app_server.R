#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @importFrom magrittr %>%
#' @noRd
app_server <- function(input, output, session) {
  mod_Generate_peptides_server("Generate_peptides_1")
  mod_Plot_AA_Distribution_server("Plot_AA_Distribution_1")
  # Your application server logic
}
