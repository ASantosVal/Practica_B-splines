#######################################################################
###
### GENERA PUNTOS SOBRE LA BSPLINE
### (por defecto, 20 PUNTOS)
### @params: bspline (data.frame)
### @params: nPuntos (integer o NULL)
###
### Devolvemos puntos (data.frame) sobre la bspline: coordenadas (x, y)
###
#######################################################################
puntosEnCurva <- function(bspline, nPuntos=NULL) {
    	puntosControl <- bspline$puntosControl
    	nudos <- bspline$nudos
    	p <- bspline$p
    
      ### CODIGO A REALIZAR:
      ### Generamos las coordenadas (x, y) y las almacenamos en la variable puntos
      puntos <- data.frame(x=double(), y=double())
      
      nPuntosControl <- dim(puntosControl)[1]
      
      incremento <- 1 / nPuntos
      u <- 0
      
      while (u < 1){
        suma <- NULL
        for (i in 1:nPuntosControl) {
          suma <- rbind(suma, (N(i, p, u, nudos) * puntosControl[i,]))
        }
        puntos<- rbind(puntos, colSums(suma))
        colnames(puntos) <- c("x","y")
        u <- u + incremento
      }
      
    	return(puntos)
}
