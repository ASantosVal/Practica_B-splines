#######################################################################
###
### CALCULA LOS NUDOS UNIFORMES DE UNA BSPLINE
### @params: n (numero de nudos)
### @params: p (grado de la bspline)
###
### Devolvemos un vector de nudos
###
#######################################################################
calculaNudosUniforme <- function(n, p) {

     nudos <- c(rep(0,p), seq(0,1,by=(1/(n-1))), rep(1,p))
 	
  	return(nudos)
}
