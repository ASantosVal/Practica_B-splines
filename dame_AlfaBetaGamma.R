#######################################################################
###
### CALCULA ALFA, BETA, GAMMA (PASO FORDWARD 1)
### @params: n (integer)
### @params: nudos (vector)
###
### Devolvemos los vectores alfa, beta, gamma
###
#######################################################################
dame_AlfaBetaGamma <- function (n, nudos) {
  	alfa  <- array(0, dim = n)
  	beta  <- array(0, dim = n)
  	gamma <- array(0, dim = n)
  
  	alfa[1] <- 0
  	alfa[n] <- 0
  	beta[1] <- 1
  	beta[n] <- 1
  	gamma[1] <- 0
  	gamma[n] <- 0
  	
    ### CODIGO A REALIZAR:
    ### Calcular los vectores alfa, beta, gamma
  	
  	#calcular alpha
  	for (k in 2:(n-1)) {
    	denominador<- (nudos[k+4]-nudos[k+1])*(nudos[k+4]-nudos[k+2])
    	if (denominador > 1.0e-8){ 
    	  numerador<- (nudos[k+4]-nudos[k+3])^2
        alfa[k] <- numerador/denominador 
    	}else{
  	    alfa[k] <-0
    	}
  	}
  	
  	#calcular beta
  	for (k in 2:(n-1)) {
  	  denominador1<- (nudos[k+4]-nudos[k+1])*(nudos[k+4]-nudos[k+2])
  	  if (denominador1 > 1.0e-8){ 
  	    numerador1<- (nudos[k+3]-nudos[k+1])*(nudos[k+4]-nudos[k+3])
  	    beta[k] <- numerador1/denominador1
  	  }else{
  	    beta[k] <-0
  	  }
  	  
  	  denominador2<- (nudos[k+5]-nudos[k+2])*(nudos[k+4]-nudos[k+2])
  	  if (denominador2 > 1.0e-8){ 
	      numerador2<- (nudos[k+5]-nudos[k+3])*(nudos[k+3]-nudos[k+2])
	      beta[k] <- beta[k]+(numerador2/denominador2)
  	  }
  	}
  	
  	#calcular gamma
  	for (k in 2:(n-1)) {
  	  denominador<- (nudos[k+4]-nudos[k+2])*(nudos[k+5]-nudos[k+2])
  	  if (denominador > 1.0e-8){ 
  	    numerador<- (nudos[k+3]-nudos[k+2])^2
  	    gamma[k] <- numerador/denominador 
  	  }else{
  	    gamma[k] <-0
  	  }
  	}
  
  	res       <- NULL
  	res$alfa  <- alfa
  	res$beta  <- beta
  	res$gamma <- gamma
  	
  	return(res)

}