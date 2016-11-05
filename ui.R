ui <- shinyUI(fluidPage(
  sidebarLayout(fluid = TRUE,
    mainPanel(width = 12,
                  tabsetPanel(
                    tabPanel("Datos", plotOutput("plot0", click="plot_click")),
                    tabPanel("Bspline", plotOutput("plot1")), 
                    tabPanel("Derivada", plotOutput("plot2")), 
                    tabPanel("FBase_Bspline", plotOutput("plot3")),
                    tabPanel("FBase_Bspline_Derivada", plotOutput("plot4"))
                  )
    ),
    sidebarPanel(width = 6,
                  radioButtons("tipo", label = "Tipo", choices = list("Uniforme" = 1, "Chord Length" = 2, "Centripeta" = 3), 
                               selected = 1, inline=T),
                  actionButton("do", "Create"),
                  actionButton("new", "New")
    )
  )
))