library('shiny')
descriptions<-sidebarLayout(
    sidebarPanel(
      sliderInput(inputId = "minconf",
                  label = "Minimun de Confiance:",
                  min = 0.2,
                  max = 1.0,
                  value = 0.6),
      sliderInput(inputId = "minsupp",
                  label = "Support Minimun:",
                  min = 0.2,
                  max = 1.0,
                  value = 0.6),
      actionButton("generate_rule", "Generate Rule")

    ),

    # Main panel for displaying outputs ----
    mainPanel(
      dataTableOutput(outputId = "tableRules"),
      tags$iframe(seamless="seamless",
                  src= "~/Desktop/r/Tp4117/result/arules.html",
                  width=800,
                  height=500)
  

    )
  )
tree_decision<-sidebarLayout(
    sidebarPanel(
      sliderInput(inputId = "minconf",
                  label = "Minimun de Confiance:",
                  min = 0.2,
                  max = 1.0,
                  value = 0.6),
      sliderInput(inputId = "minsupp",
                  label = "Support Minimun:",
                  min = 0.2,
                  max = 1.0,
                  value = 0.6),
      # actionButton("test_tree", "Predit")

    ),
    mainPanel(
      plotOutput(outputId = "plotTree"),
    )
  )
neuralNetwork<-sidebarLayout(
    sidebarPanel(
      sliderInput(inputId = "hidden",
                  label = "Nombre de Couches Caches",
                  min = 1,
                  max = 10,
                  value = 3),
      sliderInput(inputId = "splitdata",
                  label = "divisions Donnees",
                  min = 1,
                  max = 10,
                  value = 8),
      actionButton("neural_train", "Train Model")

    ),
    mainPanel(
      plotOutput(outputId = "plotNeural"),
      tableOutput("confusionData")
    )
  )