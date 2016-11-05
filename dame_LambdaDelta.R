#######################################################################
###
### CALCULA LAMBDA-DELTA (PASO FORDWARD 2)
### @params: datos (data.frame)
### @params: alfa, beta, gamma
###
### Devolvemos lambda (vector) y delta (data.frame)
###
#######################################################################
dame_LambdaDelta <- function (datos, alfa, beta, gamma) {
  	n <- length(alfa)
  	
  	lambda  <- array(0, dim = n)
  	#lambda <- array(0, dim = c(n-1,1))
  	delta  <- data.frame(x=double(), y=double())
  	
  	
    ### CODIGO A REALIZAR:
  	### Calcular lambda 
  	if (beta[1] > 1.0e-8){ 
  	  lambda[1] <- gamma[1]/beta[1]
  	}else{
  	  lambda[1] <- 0
  	}
  	
  	for (k in 2:(n-1)) {
  	  denominador<- (beta[k]-(alfa[k]*lambda[k-1]))
  	  if (denominador > 1.0e-8){ 
  	    numerador<- gamma[k]
  	    lambda[k] <- numerador/denominador 
  	  }else{
  	    lambda[k] <- 0
  	  }
  	}
  	
  	### Calcular delta 
  	if (beta[1] > 1.0e-8){ 
  	  delta[1,] <- datos[1,]/beta[1]
  	}else{
  	  delta[1,] <- 0
  	}
  	
  	for (k in 2:(n)) {
  	  denominador<- (beta[k]-(alfa[k]*lambda[k-1]))
  	  if (denominador > 1.0e-8){ 
  	    numerador <- (datos[k,]-(alfa[k]*delta[k-1,]))
  	    delta[k,] <- numerador/denominador 
  	  }else{
  	    delta[k,] <-0
  	  }
  	}

  	res        <- NULL
  	res$lambda <- lambda
  	res$delta  <- delta
  
  	return(res)
}