statistique <- sidebarLayout(
    sidebarPanel(
      fileInput("file1", "Choose CSV File",
        accept = c(
          "text/csv",
          "text/comma-separated-values,text/plain",
          ".csv")
        ),
      tags$hr(),
      actionButton("ValeurNA", "Traitement Valeurs Manquantes"),
      actionButton("binarisation", "Binairisation de L'attribut City"),
    ),
    mainPanel(
     dataTableOutput("contents")
    )
  )

kmeansWiget <- sidebarLayout(
    sidebarPanel(
      sliderInput(inputId = "k",
                  label = "Nombre de Voisins:",
                  min = 2,
                  max = 20,
                  value = 8),
      sliderInput(inputId = "split_data",
                  label = "Divisions du data:",
                  min = 5,
                  max = 10,
                  value = 6),
    ),
    mainPanel(
      plotOutput("plotKmeans")
    )
  )