#' Plot_AA_Distribution UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_Plot_AA_Distribution_ui <- function(id){
  ns <- NS(id)
  tagList(sidebarLayout(
    sidebarPanel(
      textInput(ns("peptide_sequence"),
                "Input peptide sequence",
                value = "Please enter peptide sequence"),
      textOutput(ns("value"))
    ),
    mainPanel(
      plotOutput(
        outputId = ns("abundance")
      )
      #plotOutput("plot")
    )
  )

  )
}

#' Plot_AA_Distribution Server Functions
#'
#' @noRd
mod_Plot_AA_Distribution_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    output$abundance <- renderPlot({
      if(input$peptide_sequence %in% c("",
                                       "Please enter peptide sequence")){
        NULL
      } else{
        input$peptide_sequence %>%
          CentralDogma::visualize_aa_counts() +
          ggplot2::theme(legend.position = "none")
      }
    })
  })
}

## To be copied in the UI
# mod_Plot_AA_Distribution_ui("Plot_AA_Distribution_1")

## To be copied in the server
# mod_Plot_AA_Distribution_server("Plot_AA_Distribution_1")
