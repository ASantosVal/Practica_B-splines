#######################################################################
###
### CALCULA LOS PUNTOS DE CONTROL DE LA DERIVADA DE LA BSPLINE
### @params: bspline (data.frame)
###
### Devolvemos los puntos de control de la derivada (data.frame)
###
#######################################################################
calculaPuntosControlDerivada <- function(bspline) {
  	puntosControl <- bspline$puntosControl
  	nudos <- bspline$nudos
  	p <- bspline$p
  
    ### CODIGO A REALIZAR:
    ### Calcular los puntos de control de la derivada
  	q <- NULL
    
  	# colnames(q) <- c("x", "y")
  	# rownames(q) <- NULL  
  	# q <- data.frame(q)
  
  	return(q)
}
