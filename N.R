#######################################################################
###
### FUNCION COX-DE-BOOR
### @params: i (indice)
### @params: p (grado de la curva)
### @params: u (parametro)
### @params: nudos (vector)
###
### Devolvemos el valor de la funcion base N(i,p,u)
###
#######################################################################
N <- function (i, p, u, nudos) {
  	### CODIGO A REALIZAR
    ### Calcular el valor de la funcion base N(i,p,u)
  
  nip <-0
  if (p==0){
     if ((nudos[i] <= u) & (u < nudos[i+1])){
        nip <- 1
     }
  }else{
     
     denominador1 <- nudos[i+p]-nudos[i]
     if (denominador1 > 1.0e-8){ 
       numerador1<- u-nudos[i]
       nip <- (numerador1/denominador1) * N(i,p-1,u,nudos)
     }
     
     denominador2 <- nudos[i+p+1]-nudos[i+1]
     if (denominador2 > 1.0e-8){ 
       numerador2 <- nudos[i+p+1]-u
       nip <- nip + (numerador2/denominador2) * N(i+1,p-1,u,nudos)
     }
     
  }
  	return(nip)
}
