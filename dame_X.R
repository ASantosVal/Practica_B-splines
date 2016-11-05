#######################################################################
###
### CALCULA X (PASO BACKWARD)
### @params: delta (data.frame)
### @params: lambda (vector)
###
### Devolvemos X (data.frame)
###
#######################################################################
dame_X <- function (n, delta, lambda) {
    
    ### CODIGO A REALIZAR:
    ### Calcular X
    # X <- NULL
    X <- data.frame(x=double(), y=double())
  
      #original
    X[n,] <- delta[n,]

    for (k in (n-1):1) {
      X[k,] <- delta[k,]-(lambda[k]*X[k+1,])
    }
    
      #pruebas
    # X[(3),] <- delta[(3,]
    # 
    # for (k in (2):1) {
    #   X[k,] <- delta[k,]-(lambda[k]+X[k+1,])
    # }
  
    return(X)
}