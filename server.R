
server <- shinyServer(function(input, output) {
  
      info <- reactiveValues(
          click  = NULL,
          inicio = TRUE,
          dibuja = FALSE,
          datos = NULL,
          bspline = NULL,
          derivada = NULL
      )
    
      ### Click Mouse
      observeEvent(input$plot_click, {
          if (is.null(info$click)) {
              info$click  <- input$plot_click
              info$dibuja <- TRUE
          } else {
              info$click <- NULL
          }
      })
    
      ### Boton Create
      observeEvent(input$do, {
          if (is.null(info$datos)) {
              print("AVISO: No hay datos")
          } else {
              nDatos <- dim(info$datos)[1]
              if (nDatos < 3) {
                  print("AVISO: No hay suficientes datos. Siga introduciendo datos")
              } else {
                  info$bspline  <- creaBspline(info$datos, 3, input$tipo)
                  info$derivada <- creaBsplineDerivada(info$bspline)
              }
          }
      })
      
      ### Boton NEW
      observeEvent(input$new, {
          info$click  <- NULL
          info$inicio <- TRUE
          info$dibuja <- FALSE
          info$datos <- NULL
          info$bspline <- NULL
          info$derivada <- NULL
      })
  
      ### Recogida de datos
      output$plot0 <- renderPlot({
          if (info$dibuja == TRUE) {
              new_data <- data.frame(x=info$click$x, y = info$click$y)
              if (info$inicio == TRUE) {
                  info$datos <- new_data
              } else {
                  info$datos <- rbind(info$datos, new_data)
              }
              info$dibuja <- FALSE
              info$click  <- NULL
              info$inicio <- FALSE
          }
          if (info$inicio == TRUE) {
              pantallaEnBlanco()
          } else {
              dibujaDatos(info$datos)
          }
       })
    
      ### Dibujamos bspline
      output$plot1 <- renderPlot({
      		dibujaBspline(info$bspline, info$datos)
      })
    
      ### Dibujamos la derivada de la bspline
    	output$plot2 <- renderPlot({
        	dibujaBspline(info$derivada, NULL)
      })
    
      ### Dibujamos las funciones base de la bspline
    	output$plot3 <- renderPlot({
        	dibujaFuncionesBase(info$bspline)
      })
    
      ### Dibujamos las funciones derivadas de la bspline
    	output$plot4 <- renderPlot({
        	dibujaFuncionesBase(info$derivada)
    	})
	
})
