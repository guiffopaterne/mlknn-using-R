library('shiny')
mlknn_model<-sidebarLayout(
    sidebarPanel(
      sliderInput(inputId = "min",
                  label = "Nombre Minimun de Voisins:",
                  min = 1,
                  max = 20,
                  value = 1),
      sliderInput(inputId = "max",
                  label = "Nombre Maximun de Voisins:",
                  min = 1,
                  max = 20,
                  value = 1),
      actionButton("evaluate_mlknn", "Evaluate MlKnn")

    ),

    # Main panel for displaying outputs ----
    mainPanel(
      plotOutput(outputId = "distPlot")

    )
  )