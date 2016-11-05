#######################################################################
###
### GENERA PUNTOS A PARTIR DE LAS FUNCIONES BASE DE LA  BSPLINE 
### (por defecto, 20 PUNTOS)
### @params: bspline (data.frame)
### @params: nPuntos (integer o NULL)
###
### Devolvemos puntos (data.frame) a partir de las funciones base de
### la bspline
### Cada punto de la funcion base N(i, p, u, nudos): 
### coordenadas (x, y) y color (i == indice de la funcion base) 
###
#######################################################################
puntosEnFuncionesBase <- function(bspline, nPuntos=NULL) {
    	puntosControl <- bspline$puntosControl
    	nudos <- bspline$nudos
    	p <- bspline$p
    
    	### CODIGO A REALIZAR:
        ### Generamos los puntos (x, y, color) y los almacenamos en la variable puntos
      
      puntos <- data.frame(x=double(), y=double())
      
      nPuntosControl <- dim(puntosControl)[1]
      
      incremento <- 1 / nPuntos
      
      for (i in 1:nPuntosControl) {
        u <- 0
        while (u < 1){
          x <- u
          y <- N(i, p, u, nudos)
          color <- i
          puntos<- rbind(puntos, c(x,y,color))
          u <- u + incremento
        }
      }
      
      colnames(puntos) <- c("x","y","color")
      puntos$color <- factor (puntos$color)
    		
    	return(puntos)
}
